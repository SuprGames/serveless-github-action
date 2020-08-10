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

## License

The Dockerfile and associated scripts and documentation in this project are released under MIT license.
