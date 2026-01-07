---
source: https://docs.digitalocean.com/products/databases/kafka/how-to/connect/
scraped: 2025-01-07
tags: [digitalocean, databases, managed-db, api-docs]
---

                How to Connect to Kafka Clusters | DigitalOcean Documentation

*   [
    
    DigitalOcean | Docs](https://docs.digitalocean.com/)

*   

*   [Platform](https://docs.digitalocean.com/platform/)
*   [Products](https://docs.digitalocean.com/products/)
*   [Reference](https://docs.digitalocean.com/reference/)
*   [Support](https://docs.digitalocean.com/support/)
*   [Sign Up](https://cloud.digitalocean.com/registrations/new)

*   [![](/images/icons/kafka.6e5f03a9446ce8ef1cb8ff94d5cfc2174c6a0778b884650e64476af3a9d0888b.svg)Kafka](/products/databases/kafka/)
*   [Getting Started](/products/databases/kafka/getting-started/)
    *   [Quickstart](/products/databases/kafka/getting-started/quickstart/)
*   [How-Tos](/products/databases/kafka/how-to/)
    *   [Create Kafka Clusters](/products/databases/kafka/how-to/create/)
    *   [Connect to Kafka Clusters](/products/databases/kafka/how-to/connect/)
    *   [Create Kafka Topics](/products/databases/kafka/how-to/create-topics/)
    *   [Resize Database Clusters](/products/databases/kafka/how-to/resize/)
    *   [Secure Kafka Clusters](/products/databases/kafka/how-to/secure/)
    *   [Schedule Automatic Updates](/products/databases/kafka/how-to/schedule-updates/)
    *   [Manage Users and Privileges](/products/databases/kafka/how-to/manage-users-and-privileges/)
    *   [Monitor Kafka Performance](/products/databases/kafka/how-to/monitor-databases/)
    *   [Monitor Cluster Performance](/products/databases/kafka/how-to/monitor-clusters/)
    *   [Set Up Monitoring Alerts](/products/databases/kafka/how-to/set-up-alerts/)
    *   [Forward Logs](/products/databases/kafka/how-to/forward-logs/)
    *   [Destroy Clusters](/products/databases/kafka/how-to/destroy/)
    *   [Enable Schema Registry](/products/databases/kafka/how-to/enable-schema-registry/)
    *   [Tag Database Clusters](/products/databases/kafka/how-to/tag/)
    *   [Reconfigure Database Clusters](/products/databases/kafka/how-to/reconfigure/)
*   [Reference](/products/databases/kafka/reference/)
    *   [API Reference](https://docs.digitalocean.com/reference/api/digitalocean/#tag/Databases)
    *   [CLI Reference](/reference/doctl/reference/databases/)
    *   [MCP Reference](/reference/mcp/)
*   [Concepts](/products/databases/kafka/concepts/)
    *   [Best Practices](/products/databases/kafka/concepts/best-practices/)
    *   [Shared Responsibility Model](/products/databases/kafka/concepts/responsibility-model/)
*   [Details](/products/databases/kafka/details/)
    *   [Features](/products/databases/kafka/details/features/)
    *   [Pricing](/products/databases/kafka/details/pricing/)
    *   [Availability](/products/databases/kafka/details/availability/)
    *   [Limits](/products/databases/kafka/details/limits/)
    *   [Cluster Notifications](/products/databases/kafka/details/notifications/)
    *   [Service-Level Agreement](https://www.digitalocean.com/sla/databases)

*   [How-Tos](/products/databases/kafka/how-to/) 
*   Connect to Kafka Clusters

[Give Feedback](https://ideas.digitalocean.com/documentation)

# How to Connect to Kafka Clusters

Validated on 8 Dec 2022 • Last edited on 17 Jun 2025

Kafka is an open-source distributed event and stream-processing platform built to process demanding real-time data feeds. It is inherently scalable, with high throughput and availability.

You can connect to DigitalOcean Managed Databases using command line tools and other third-party clients. This guide explains where to find your Kafka database’s connection details and how to use them to configure tools and clients.

## Retrieve Database Connection Details Using the CLI[](#retrieve-database-connection-details-using-the-cli)

How to Retrieve Database Connection Details Using the DigitalOcean CLI

1.  [Install `doctl`](https://docs.digitalocean.com/reference/doctl/how-to/install/), the official DigitalOcean CLI.
2.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with `doctl`.
3.  Use the token to grant `doctl` access to your DigitalOcean account.
    
        doctl auth init
    
4.  Finally, run `doctl databases connection`. Basic usage looks like this, but you can [read the usage docs](https://docs.digitalocean.com/reference/doctl/reference/databases/connection/) for more details:
    
        doctl databases connection <database-cluster-id> [flags]
    
    The following example retrieves the connection details for a database cluster with the ID `f81d4fae-7dec-11d0-a765-00a0c91e6bf6`:
    
        doctl databases connection f81d4fae-7dec-11d0-a765-00a0c91e6bf6
    

## Retrieve Database Connection Details Using the API[](#retrieve-database-connection-details-using-the-api)

This API call retrieves the information about your database, including its connection details. The connection details are located in the returned `connection` JSON object.

How to Retrieve Database Connection Details Using the DigitalOcean API

1.  [Create a personal access token](https://docs.digitalocean.com/reference/api/create-personal-access-token/) and save it for use with the API.
2.  Send a GET request to [`https://api.digitalocean.com/v2/databases/{database_cluster_uuid}`](https://docs.digitalocean.com/reference/api/digitalocean//#operation/databases_get_cluster).

### cURL[](#retrieve-database-connection-details-curl)

Using cURL:

    curl -X GET \
      -H "Content-Type: application/json" \
      -H "Authorization: Bearer $DIGITALOCEAN_TOKEN" \
      "https://api.digitalocean.com/v2/databases/9cc10173-e9ea-4176-9dbc-a4cee4c4ff30"

### Go[](#retrieve-database-connection-details-go)

Using [Godo](https://github.com/digitalocean/godo), the official DigitalOcean API client for Go:

    import (
        "context"
        "os"
    
        "github.com/digitalocean/godo"
    )
    
    func main() {
        token := os.Getenv("DIGITALOCEAN_TOKEN")
    
        client := godo.NewFromToken(token)
        ctx := context.TODO()
    
        cluster, _, err := client.Databases.Get(ctx, "9cc10173-e9ea-4176-9dbc-a4cee4c4ff30")
    }

### Python[](#retrieve-database-connection-details-python)

Using [PyDo](https://github.com/digitalocean/pydo), the official DigitalOcean API client for Python:

    import os
    from pydo import Client
    
    client = Client(token=os.environ.get("DIGITALOCEAN_TOKEN"))
    
    get_resp = client.databases.get_cluster(database_cluster_uuid="a7a89a")

## View Kafka Cluster Connection Details[](#connection-details)

You use your database’s connection details to configure tools, applications, and resources that connect to the database. To view your database’s connection details, click the name of the cluster on [the Databases page](https://cloud.digitalocean.com/databases) to go to its **Overview** page.

![Databases Overview screen showing connection string](https://docs.digitalocean.com/screenshots/databases/kafka-connection-details.7d7962e82ce9a7a9ec0ddae01ccf7300234732ef599545488877930080b29406.png)

You can view customized connection details based on how you want to connect to the database:

*   **Public network** and **[VPC](/products/networking/vpc/) network** options generate connection details based on if you want to connect via the cluster’s public hostname or the cluster’s private hostname. Only other resources in the same VPC network as the cluster can access it using its private hostname.
    
*   The **User** field updates the connection details with the [user credentials](/products/databases/kafka/how-to/manage-users-and-privileges/) that you would like to connect with.
    

By default, the control panel doesn’t reveal the cluster’s password for security reasons. Click **Copy** to copy connection details with the password, or click **show-password** to reveal the password.

## Download the SSL Encryption[](#certificate)

Each managed database comes with an SSL certificate. You can use this SSL certificate to encrypt connections between your client applications and the database.

To download your database’s SSL certificate, click the name of the cluster on [the Databases page](https://cloud.digitalocean.com/databases) to go to its **Overview** page. In the **Connection Details** section, click **Download CA certificate**.

![Databases connection details with Download CA Certificate selected](https://docs.digitalocean.com/screenshots/databases/kafka-ssl-certificate.19f793027df6784e9640b8045ae7eca93589beea5c38d255d493fc8218f85bf8.png)

When you configure your client applications, you can use the certificate’s location on your local system. Each client application is configured differently, so check the documentation for the tool you’re using for more detail on setting up SSL connections.

## Connect to the Database[](#connect-to-the-database)

You can connect and manage the database using one of the following programming languages, via either [SSL](#ssl) or [SASL](#sasl). For the best security, we recommend you connect via SSL.

### Connect via SSL[](#ssl)

To connect via SSL, download [your cluster’s CA certificate](#certificate). Then, download its access key and access certificate by clicking **Download access key** and **Download access certificate** in the SSL tab.

To connect a producer, use one of the following code blocks and the files you downloaded above:

 Python

    from kafka import KafkaProducer
    
    producer = KafkaProducer(
        bootstrap_servers=f"{HOST}:{SSL_PORT}",
        security_protocol="SSL",
        ssl_cafile="ca-certificate.crt",
        ssl_certfile="user-access-certificate.crt",
        ssl_keyfile="user-access-key.key",
    )

 Java

    Properties properties = new Properties();
    properties.put("bootstrap.servers", "{HOST}:{SSL_PORT}");
    properties.put("security.protocol", "SSL");
    properties.put("ssl.truststore.location", "{TRUSTSTORE_LOCATION}");
    properties.put("ssl.truststore.password", "{TRUSTSTORE_PASSWORD}");
    properties.put("ssl.keystore.type", "PKCS12");
    properties.put("ssl.keystore.location", "{KEYSTORE_LOCATION}");
    properties.put("ssl.keystore.password", "{KEYSTORE_PASSWORD}");
    properties.put("ssl.key.password", "{KEY_PASSWORD}");
    properties.put("key.serializer", "{SERIALIZER}");
    properties.put("value.serializer", "{SERIALIZER}");
    
    // create a producer
    KafkaProducer<String, String> producer = new KafkaProducer<>(properties);

 Go

This method requires that you install [Sarama](https://github.com/Shopify/sarama), a Go client library for Kafka.

    package main
    
    import (
        "crypto/tls"
        "crypto/x509"
        "io/ioutil"
        "log"
        "github.com/Shopify/sarama"
    )
    
    func main() {
        keypair, err := tls.LoadX509KeyPair("user-access-certificate.crt", "user-access-key.key")
        if err != nil {
            log.Println(err)
            return
        }
    
        caCert, err := ioutil.ReadFile("ca-certificate.crt")
        if err != nil {
            log.Println(err)
            return
        }
        caCertPool := x509.NewCertPool()
        caCertPool.AppendCertsFromPEM(caCert)
    
        tlsConfig := &tls.Config{
            Certificates: []tls.Certificate{keypair},
            RootCAs: caCertPool,
        }
    
        // init config, enable errors and notifications
        config := sarama.NewConfig()
        config.Producer.Return.Successes = true
        config.Net.TLS.Enable = true
        config.Net.TLS.Config = tlsConfig
        config.Version = sarama.V0_10_2_0
    
        brokers := []string{"{HOST}:{SSL_PORT}"}
    
        producer, err := sarama.NewSyncProducer(brokers, config)
    
        // add your logic
    }

 NodeJS

    const Kafka = require('node-rdkafka');
    console.log(Kafka.features); // this should print 'ssl', among other things
    
    const producer = new Kafka.Producer({
        'metadata.broker.list': HOST:SSL_PORT,
        'security.protocol': 'ssl',
        'ssl.key.location': 'user-access-key.key',
        'ssl.certificate.location': 'user-access-certificate.crt',
        'ssl.ca.location': 'ca-certificate.crt',
        'dr_cb': true
    });
    
    producer.connect();
    
    producer.on('ready', () => {
        // produce the messages and disconnect
    });

To connect a consumer, use one of the following code blocks and the files you downloaded above:

 Python

    from kafka import KafkaConsumer
    
    consumer = KafkaConsumer(
        "TOPIC_NAME",
        auto_offset_reset="START_FROM",
        bootstrap_servers=f"{HOST}:{SSL_PORT}",
        client_id = CONSUMER_CLIENT_ID,
        group_id = CONSUMER_GROUP_ID,
        security_protocol="SSL",
        ssl_cafile="ca-certificate.crt",
        ssl_certfile="user-access-certificate.crt",
        ssl_keyfile="user-access-key.key",
    )

 Java

    String group_id = "groupid";
    
    Properties properties = new Properties();
    properties.put("bootstrap.servers", "{HOST}:{SSL_PORT}");
    properties.put("security.protocol", "SSL");
    properties.put("ssl.truststore.location", "{TRUSTSTORE_LOCATION}");
    properties.put("ssl.truststore.password", "{TRUSTSTORE_PASSWORD}");
    properties.put("ssl.keystore.type", "PKCS12");
    properties.put("ssl.keystore.location", "{KEYSTORE_LOCATION}");
    properties.put("ssl.keystore.password", "{KEYSTORE_PASSWORD}");
    properties.put("ssl.key.password", "{KEY_PASSWORD}");
    properties.put("key.deserializer", "{DESERIALIZER}");
    properties.put("value.deserializer", "{DESERIALIZER}");
    properties.put("group.id", group_id);
    
    // create a consumer
    KafkaConsumer<String, String> consumer = new KafkaConsumer<>(properties);

 Go

This method requires that you install [Sarama](https://github.com/Shopify/sarama), a Go client library for Kafka.

    package main
    
    import (
        "crypto/tls"
        "crypto/x509"
        "io/ioutil"
        "log"
        "github.com/Shopify/sarama"
    )
    
    func main() {
        keypair, err := tls.LoadX509KeyPair("user-access-certificate.crt", "user-access-key.key")
        if err != nil {
            log.Println(err)
            return
        }
    
        caCert, err := ioutil.ReadFile("ca-certificate.crt")
        if err != nil {
            log.Println(err)
            return
        }
        caCertPool := x509.NewCertPool()
        caCertPool.AppendCertsFromPEM(caCert)
    
        tlsConfig := &tls.Config{
            Certificates: []tls.Certificate{keypair},
            RootCAs: caCertPool,
        }
    
        // init config, enable errors and notifications
        config := sarama.NewConfig()
        config.Producer.Return.Successes = true
        config.Net.TLS.Enable = true
        config.Net.TLS.Config = tlsConfig
        config.Version = sarama.V0_10_2_0
    
        brokers := []string{"{HOST}:{SSL_PORT}"}
    
        consumer, err := sarama.NewConsumer(brokers, config)
    
        // add your logic
    }

 NodeJS

    const Kafka = require('node-rdkafka');
    
    const stream = new Kafka.createReadStream({
        'metadata.broker.list': HOST:SSL_PORT,
        'group.id': CONSUMER_GROUP,
        'security.protocol': 'ssl',
        'ssl.key.location': 'user-access-key.key',
        'ssl.certificate.location': 'user-access-certificate.crt',
        'ssl.ca.location': 'ca-certificate.crt'
    }, {}, {'topics': ['demo-topic']});
    
    stream.on('data', (message) => {
        // process message
    });

### Connect via SASL[](#sasl)

To connect via SASL, download [your cluster’s CA certificate](#certificate).

To connect a producer, use one of the following code blocks and the file you downloaded above:

 Python

    from kafka import KafkaProducer
    
    # Choose an appropriate SASL mechanism, for instance:
    SASL_MECHANISM = 'SCRAM-SHA-256'
    
    producer = KafkaProducer(
       bootstrap_servers=f"{HOST}:{SASL_PORT}",
       sasl_mechanism = SASL_MECHANISM,
       sasl_plain_username = SASL_USERNAME,
       sasl_plain_password = SASL_PASSWORD,
       security_protocol="SASL_SSL",
       ssl_cafile="ca-certificate.crt",
    )

 Java

    String sasl_username = "{USER_NAME}";
    String sasl_password = "{SASL_PASSWORD}";
    String jaasTemplate = "org.apache.kafka.common.security.scram.ScramLoginModule required username=\"%s\" password=\"%s\";";
    String jaasConfig = String.format(jaasTemplate, sasl_username, sasl_password);
    
    Properties properties = new Properties();
    properties.put("bootstrap.servers", "{HOST}:{SASL_PORT}");
    properties.put("security.protocol", "SASL_SSL");
    properties.put("sasl.mechanism", "SCRAM-SHA-256");
    properties.put("sasl.jaas.config", jaasConfig);
    properties.put("ssl.endpoint.identification.algorithm", "");
    properties.put("ssl.truststore.type", "jks");
    properties.put("ssl.truststore.location", "{TRUSTSTORE_LOCATION}");
    properties.put("ssl.truststore.password", "{TRUSTSTORE_PASSWORD}");
    properties.put("key.serializer", "{SERIALIZER}");
    properties.put("value.serializer", "{SERIALIZER}");
    
    // create a producer
    KafkaProducer<String, String> producer = new KafkaProducer<>(properties);

 Go

This method requires that you install [Sarama](https://github.com/Shopify/sarama), a Go client library for Kafka.

    package main
    
    import (
        "crypto/tls"
        "crypto/x509"
        "github.com/Shopify/sarama"
        "io/ioutil"
    )
    
    func main() {
        caCert, err := ioutil.ReadFile("ca-certificate.crt")
        if err != nil {
            panic(err)
        }
        caCertPool := x509.NewCertPool()
        caCertPool.AppendCertsFromPEM(caCert)
    
        tlsConfig := &tls.Config{
            RootCAs: caCertPool,
        }
    
        // init config, enable errors and notifications
        config := sarama.NewConfig()
        config.Metadata.Full = true
        config.ClientID = "{CLIENT_ID}"
        config.Producer.Return.Successes = true
    
        // Kafka SASL configuration
        config.Net.SASL.Enable = true
        config.Net.SASL.User = "{SASL_USERNAME}"
        config.Net.SASL.Password = "{SASL_PASSWORD}"
        config.Net.SASL.Handshake = true
        config.Net.SASL.Mechanism = sarama.SASLTypePlaintext
    
        // TLS configuration
        config.Net.TLS.Enable = true
        config.Net.TLS.Config = tlsConfig
    
        brokers := []string{"{HOST}:{SASL_PORT}"}
        producer, err := sarama.NewSyncProducer(brokers, config)
    
        // add your logic
    }

 NodeJS

    const Kafka = require('node-rdkafka');
    console.log(Kafka.features); // this should print 'sasl_ssl', among other things
    
    const producer = new Kafka.Producer({
        'metadata.broker.list': HOST:SASL_PORT,
        'security.protocol': 'sasl_ssl',
        'sasl.mechanism': SASL_MECHANISM,
        'sasl.username': USER_NAME,
        'sasl.password': SASL_PASSWORD,
        'ssl.ca.location': 'ca-certificate.crt',
        'dr_cb': true
    });
    
    producer.connect();
    
    producer.on('ready', () => {
      // produce the messages and disconnect
    });

To connect a consumer, use one of the following code blocks and the files you downloaded above:

 Python

    from kafka import KafkaConsumer
    
    # Choose an appropriate SASL mechanism, for instance:
    SASL_MECHANISM = 'SCRAM-SHA-256'
    
    consumer = KafkaConsumer(
        "TOPIC_NAME",
        auto_offset_reset = "START_FROM",
        bootstrap_servers = f'{HOST}:{SASL_PORT}',
        client_id = CONSUMER_CLIENT_ID,
        group_id = CONSUMER_GROUP_ID,
        sasl_mechanism = SASL_MECHANISM,
        sasl_plain_username = SASL_USERNAME,
        sasl_plain_password = SASL_PASSWORD,
        security_protocol = "SASL_SSL",
        ssl_cafile = "ca-certificate.crt"
    )

 Java

    String group_id = "groupid";
    String sasl_username = "{USER_NAME}";
    String sasl_password = "{SASL_PASSWORD}";
    String jaasTemplate = "org.apache.kafka.common.security.scram.ScramLoginModule required username=\"%s\" password=\"%s\";";
    String jaasConfig = String.format(jaasTemplate, sasl_username, sasl_password);
    
    Properties properties = new Properties();
    properties.put("bootstrap.servers", "{HOST}:{SASL_PORT}");
    properties.put("security.protocol", "SASL_SSL");
    properties.put("sasl.mechanism", "SCRAM-SHA-256");
    properties.put("sasl.jaas.config", jaasConfig);
    properties.put("ssl.endpoint.identification.algorithm", "");
    properties.put("ssl.truststore.type", "jks");
    properties.put("ssl.truststore.location", "{TRUSTSTORE_LOCATION}");
    properties.put("ssl.truststore.password", "{TRUSTSTORE_PASSWORD}");
    properties.put("key.deserializer", "{DESERIALIZER}");
    properties.put("value.deserializer", "{DESERIALIZER}");
    properties.put("group.id", group_id);
    
    // create a consumer
    KafkaConsumer<String, String> consumer = new KafkaConsumer<>(properties);

 Go

This method requires that you install [Sarama](https://github.com/Shopify/sarama), a Go client library for Kafka.

    package main
    
    import (
        "crypto/tls"
        "crypto/x509"
        "github.com/Shopify/sarama"
        "io/ioutil"
    )
    
    func main() {
        caCert, err := ioutil.ReadFile("ca-certificate.crt")
        if err != nil {
            panic(err)
        }
        caCertPool := x509.NewCertPool()
        caCertPool.AppendCertsFromPEM(caCert)
    
        tlsConfig := &tls.Config{
            RootCAs: caCertPool,
        }
    
        // init config, enable errors and notifications
        config := sarama.NewConfig()
        config.Metadata.Full = true
        config.ClientID = "{CLIENT_ID}"
        config.Producer.Return.Successes = true
    
        // Kafka SASL configuration
        config.Net.SASL.Enable = true
        config.Net.SASL.User = "{SASL_USERNAME}"
        config.Net.SASL.Password = "{SASL_PASSWORD}"
        config.Net.SASL.Handshake = true
        config.Net.SASL.Mechanism = sarama.SASLTypePlaintext
    
        // TLS configuration
        config.Net.TLS.Enable = true
        config.Net.TLS.Config = tlsConfig
    
        brokers := []string{"{HOST}:{SASL_PORT}"}
        consumer, err := sarama.NewConsumer(brokers, config)
    
        // add your logic
    }

 NodeJS

    const Kafka = require('node-rdkafka');
    
    const stream = new Kafka.createReadStream({
        'metadata.broker.list': HOST:SASL_PORT,
        'group.id': CONSUMER_GROUP,
        'security.protocol': 'sasl_ssl',
        'sasl.mechanism': SASL_MECHANISM,
        'sasl.username': USER_NAME,
        'sasl.password': SASL_PASSWORD,
        'ssl.ca.location': 'ca-certificate.crt'
    }, {}, {'topics': ['demo-topic']});
    
    stream.on('data', (message) => {
        // process message
    });

In this article...

*   [Retrieve Database Connection Details Using the CLI](#retrieve-database-connection-details-using-the-cli)
*   [Retrieve Database Connection Details Using the API](#retrieve-database-connection-details-using-the-api)
*   [View Kafka Cluster Connection Details](#connection-details)
*   [Download the SSL Encryption](#certificate)
*   [Connect to the Database](#connect-to-the-database)
    *   [Connect via SSL](#ssl)
    *   [Connect via SASL](#sasl)

##### Company

*   [About](https://www.digitalocean.com/about)
*   [Careers](https://www.digitalocean.com/careers)
*   [Blog](https://www.digitalocean.com/blog)

##### Docs

*   [Docs Home](https://docs.digitalocean.com)
*   [API Reference](https://docs.digitalocean.com/reference/api)
*   [CLI Reference](https://docs.digitalocean.com/reference/doctl)
*   [Release Notes](https://docs.digitalocean.com/release-notes)
*   [Trust Platform](https://www.digitalocean.com/trust)

##### Community

*   [Tutorials](https://www.digitalocean.com/community/tutorials)
*   [Q&A](https://www.digitalocean.com/community/questions)
*   [Write for DOnations](https://www.digitalocean.com/community/pages/write-for-digitalocean)
*   [Currents Research](https://www.digitalocean.com/currents)
*   [Legal](https://www.digitalocean.com/legal)
*   [Code of Conduct](https://www.digitalocean.com/community/pages/code-of-conduct)

##### Support

*   [Support Center](/support)
*   [Report Abuse](https://www.digitalocean.com/company/contact/abuse)

* * *

© 2025 DigitalOcean, LLC. All rights reserved

[](https://x.com/digitalocean)[](https://www.instagram.com/thedigitalocean)[](https://www.facebook.com/DigitalOceanCloudHosting)[](https://discord.gg/digitalocean)[](https://www.youtube.com/DigitalOcean)[](https://www.linkedin.com/company/digitalocean)[](https://github.com/digitalocean)

### We can't find any results for your search.

Try using different keywords or sim
