
# cargo

## tomcat

```xml
<plugin>
    <groupId>org.codehaus.cargo</groupId>
    <artifactId>cargo-maven2-plugin</artifactId>
    <version>1.7.7</version>
    <configuration>
        <container>
        <containerId>tomcat9x</containerId>
        <type>embedded</type>
        </container>
        <configuration>
        <properties>
            <cargo.servlet.port>8081</cargo.servlet.port>
        </properties>
        </configuration>
    </configuration>
</plugin>
```

## jetty

```
<plugin>
    <groupId>org.codehaus.cargo</groupId>
    <artifactId>cargo-maven2-plugin</artifactId>
    <version>1.7.7</version>
    <configuration>
        <container>
        <containerId>jetty9x</containerId>
        <type>embedded</type>
        </container>
    </configuration>
</plugin>
```