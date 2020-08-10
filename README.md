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
 * If you need to install your plugins, you will need to call npm install before you call your serverless plugin
   ``` 
    # Set up of Node 12
    - name: Installing Node 12  
      uses: actions/setup-node@v2-beta
      with:
        node-version: '12'  
    # This is needed if you have plugins that you need to install in your Serverless
    - name: npm install
      uses: actions/npm@master
      with:
        args: install
    ```    

## License

The Dockerfile and associated scripts and documentation in this project are released under MIT license.
