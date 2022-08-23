# GitHub Action - AWS SSM Run Command

Github Action for running commands on Linux or Windows machine managed using SSM

## Usage

```yaml
- name: Execute command
  uses: debugger24/action-aws-ssm-run-command@v1
  with:
      aws-region: us-east-1
      instance-ids: |
        instance_id_1
        instance_id_2
      commands: |
        pwd
        ls
        echo "Executed by Github Actions Workflow #${{ github.run_id }}" >> test.txt
```

## Action Inputs

| Input Name        | Description                                                    | Required | Default Value                                             |
|-------------------|----------------------------------------------------------------|----------|-----------------------------------------------------------|
| aws-region        | AWS Region                                                     | true     |                                                           |
| instance-ids      | List of Instance IDs to execute command                        | true     |                                                           |
| commands          | Commands to be executed on instance                            | true     |                                                           |
| os                | (Optional) Operating system to run commands (windows or linux) | false    | linux                                                     |
| working-directory | (Optional) Working directory for command execution             | false    |                                                           |
| comment           | (Optional) Comment                                             | false    | Executed by Github Actions Workflow #${{ github.run_id }} |

## Action Outputs

| Output Name | Description                                            |
|-------------|--------------------------------------------------------|
| command-id  | Execution command ID generated by AWS send command API |
