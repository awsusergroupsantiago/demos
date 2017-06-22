# Demo 1
## CloudFormation

### How Run The CloudFormation For The Creation of Resources
#### Example with the format YML
```
aws cloudformation deploy --template-file cloudformation/ec2.yml --stack-name nginx-demo-1
```
#### Example with the format JSON
```
aws cloudformation deploy --template-file cloudformation/ec2.json --stack-name nginx-demo-1
```

### How Run The Ansible for The Provisioning of Infraestructure
```
ansible-playbook -i ansible/uat ansible/playbooks/install-nginx.yml
```
