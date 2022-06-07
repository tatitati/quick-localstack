1. update loca-cf.yml as you wish
2. ./start
3. Point your aws client to localstack:

```
sns_client = boto3.client('sns', endpoint_url="http://127.0.0.1:4566")
```


there you go your local aws running in local (with your cloudformation already deployed in local)
