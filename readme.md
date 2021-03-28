
# maven

## linux 环境变量
```shell script
vi /etc/profile

export M2_HOME=/home/program/maven/app
export PATH=$JAVA_HOME/bin:$M2_HOME/bin:$PATH

source /etc/profile
```

## 命令

- mvn -e

    显示详细错误 信息
    
- mvn dependency:tree

    查看依赖树，解决依赖问题

- mvn validate

    验证工程是否正确，所有需要的资源是否可用。
    
- mvn verify

    运行任何检查，验证包是否有效且达到质量标准。 
    
## exec 执行

```xml
<?xml version="1.0" encoding="utf-8" ?>

<plugins>
    <plugin>
        <groupId>org.codehaus.mojo</groupId>
        <artifactId>exec-maven-plugin</artifactId>
        <executions>
            <execution>
                <goals>
                    <goal>java</goal>
                </goals>
            </execution>
        </executions>
        <configuration>
            <mainClass>test.TestSendMail2</mainClass>
        </configuration>
    </plugin>
</plugins>
```

```shell script
mvn exec:java -Dexec.mainClass="c332030.Main"
mvn exec:exec -Dexec.mainClass="c332030.Main"
```
    
## param

- -DskipTests=true

    跳过测试


