# SuprGames Serveless Github Action
Serverless Github Action with the good versions!

* Node 12
* Serverless 1.77

Base line image: node:12-slim


## Usage

```
on:
  push:
    branches:
      - master
name: Deploy master branch
jobs:
  deploy:
    name: deploy
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    # The NPM Install will install all the Plugins that you have used in your Serverless YML file
    - name: npm install
      uses: actions/npm@master
      with:
        args: install
    # Deployment of your project
    - name: serverless deploy
      uses: suprgames/serverless-github-action@master
      with:
        args: deploy
      env:
        # To link with your Serverless Framework account, equivalent to login
        SERVERLESS_ACCESS_KEY: ${{ secrets.SERVERLESS_ACCESS_KEY }}
        # The AWS Credentials
        AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
        AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
```

## Considerations
 * Environment variables :The three environment variables used are based in Github Secrets, so you need to create the Secrets in your repository so GithubAction can make use of them
 * If you do not require integration with Serverless system, then you don't need to have Serverless access key, but then you need to remove any references to Org in your Yaml. I recoment to create the Key in Serverless Framework and then you register the secret.
 * The AWS credentials you are using here need to have privileges to do the operations you require.

## License

The Dockerfile and associated scripts and documentation in this project are released under MIT license.
