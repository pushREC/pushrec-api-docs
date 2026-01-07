#!/usr/bin/env python3
"""
config.py - Single source of truth for all configuration

Usage in any module:
    from config import load_config, get_sources, get_setting

    config = load_config()
    sources = get_sources(config)  # Dynamic list
    threshold = get_setting(config, "min_content_length", default=500)
"""

from pathlib import Path
from typing import Dict, List, Any, Optional

try:
    import yaml
except ImportError:
    yaml = None

# Default config path relative to this file
CONFIG_PATH = Path(__file__).parent.parent / "config" / "sources.yaml"


class ConfigError(Exception):
    """Raised when configuration is invalid."""
    pass


def load_config(config_path: Optional[Path] = None) -> Dict:
    """
    Load and validate configuration from YAML file.

    Args:
        config_path: Optional path to config file. Defaults to sources.yaml.

    Returns:
        Configuration dictionary.

    Raises:
        ConfigError: If config file is missing, invalid, or malformed.
    """
    path = Path(config_path) if config_path else CONFIG_PATH

    if not path.exists():
        raise ConfigError(f"[ERROR] Config not found: {path}")

    if yaml is None:
        print("[WARN] PyYAML not installed. Using fallback config.")
        return _fallback_config()

    try:
        with open(path, "r", encoding="utf-8") as f:
            config = yaml.safe_load(f)
    except yaml.YAMLError as e:
        raise ConfigError(f"[ERROR] Invalid YAML in {path}: {e}")
    except PermissionError:
        raise ConfigError(f"[ERROR] Permission denied reading: {path}")
    except Exception as e:
        raise ConfigError(f"[ERROR] Failed to read config: {e}")

    # Validate required sections
    _validate_config(config, path)

    return config


def _validate_config(config: Dict, path: Path) -> None:
    """Validate configuration structure."""
    if config is None:
        raise ConfigError(f"[ERROR] Config file is empty: {path}")

    if "sources" not in config:
        raise ConfigError(f"[ERROR] Config missing 'sources' section in {path}")

    if not config["sources"]:
        raise ConfigError(f"[ERROR] No sources defined in {path}")

    # Validate each source has required fields
    for name, source in config["sources"].items():
        if not isinstance(source, dict):
            raise ConfigError(f"[ERROR] Invalid source '{name}': must be a dictionary")
        if "output_dir" not in source:
            raise ConfigError(f"[ERROR] Source '{name}' missing 'output_dir'")


def _fallback_config() -> Dict:
    """Fallback config when PyYAML is not available."""
    return {
        "system": {
            "min_content_length": 500,
            "staleness_days": 30,
            "archive_after_days": 30,
        },
        "sources": {
            "claude-code": {
                "name": "Claude Code Documentation",
                "base_url": "https://docs.anthropic.com/en/docs/claude-code",
                "output_dir": "claude-code",
            },
            "claude-api": {
                "name": "Claude API Documentation",
                "base_url": "https://docs.anthropic.com/en/api",
                "output_dir": "claude-api",
            },
            "agent-sdk": {
                "name": "Claude Agent SDK",
                "base_url": "https://github.com/anthropics/claude-code-sdk-python",
                "output_dir": "agent-sdk",
            },
        },
    }


def get_sources(config: Dict) -> List[str]:
    """
    Get list of source names from config.

    Args:
        config: Configuration dictionary.

    Returns:
        List of source names (e.g., ["claude-code", "claude-api", "agent-sdk"])
    """
    return list(config.get("sources", {}).keys())


def get_setting(config: Dict, key: str, default: Any = None) -> Any:
    """
    Get system setting with fallback to default.

    Args:
        config: Configuration dictionary.
        key: Setting name (e.g., "min_content_length", "staleness_days")
        default: Default value if setting not found.

    Returns:
        Setting value or default.
    """
    return config.get("system", {}).get(key, default)


def get_source_config(config: Dict, source: str) -> Dict:
    """
    Get configuration for a specific source.

    Args:
        config: Configuration dictionary.
        source: Source name (e.g., "claude-code")

    Returns:
        Source configuration dictionary.

    Raises:
        ConfigError: If source not found.
    """
    sources = config.get("sources", {})
    if source not in sources:
        available = list(sources.keys())
        raise ConfigError(
            f"[ERROR] Unknown source: '{source}'. Available: {available}"
        )
    return sources[source]


def get_output_dir(config: Dict, source: str) -> str:
    """
    Get output directory for a source.

    Args:
        config: Configuration dictionary.
        source: Source name.

    Returns:
        Output directory name.
    """
    source_config = get_source_config(config, source)
    return source_config.get("output_dir", source)


# Quick test when run directly
if __name__ == "__main__":
    try:
        config = load_config()
        print("[OK] Config loaded successfully")
        print(f"Sources: {get_sources(config)}")
        print(f"min_content_length: {get_setting(config, 'min_content_length', 500)}")
        print(f"staleness_days: {get_setting(config, 'staleness_days', 30)}")
        print(f"archive_after_days: {get_setting(config, 'archive_after_days', 30)}")
    except ConfigError as e:
        print(e)
