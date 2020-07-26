# Lambda Layer for python NLTK package

Lambda layer to enable using famous NLTK python package with lambda. This project is setup to build for python3.7 runtime and download `punkt` & `stopwords` to NLTK_DATA directory (Instruction on how to customize this to your needs below in [Configuration](#configuration)

## Usage

### Setup & Build

Clone/Download the repository and run the following command,

```shell
$ ./bin/bootstrap
$ ./bin/build
```

`./bin/build` will create a `python-nltk-layer.zip` file inside `share` folder.

### Configuration

1. Change the python runtime version your project needs in [Dockerfile](/Dockerfile#L2-L3).
   e.g if you need to build for python version 3.8 search & replace all occurances of 3.7 to `3.8` in the [Dockerfile](/Dockerfile#L2-L3)
2. Add/update instruction for downloading the NLTK data you need.
   e.g If you need NLTK `brown` corpus instead of `stopwords` you can change [this](//Dockerfile#L16) line to `RUN python -W ignore -m nltk.downloader brown -d /build/nltk_data`

### Deploy

You can create a layer in your AWS account in one of two ways,

1. You can upload the zip file directly in AWS Console, e.g screenshot on how to do that below,
   <img width="550" alt="Screen Shot 2020-07-26 at 7 49 51 AM" src="https://user-images.githubusercontent.com/3880793/88478685-4f034300-cf18-11ea-8768-737b47b03332.png">

   Or

2. Assuming you have your AWS CLI setup,more info [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html). You can run `./bin/deploy` to publish the lambda layer.

#### Lambda Instructions

1. Configure lambda to use the lambda layer you published above.
2. Due to the [manual setup](https://www.nltk.org/data.html#manual-installation) of NLTK Data, you need to set `NLTK_DATA=/opt/nltk_data` environment variable for your lambda function.
<img width="800" alt="Screen Shot 2020-07-26 at 7 57 33 AM" src="https://user-images.githubusercontent.com/3880793/88478683-4e6aac80-cf18-11ea-9133-223348260d85.png">

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/customink/lambda-python-nltk-layer. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
