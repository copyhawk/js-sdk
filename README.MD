# CopyHawk JS SDK

Copyhawk JS SDK allows you to access all your Copyhawk content programmatically inside any HTML site.

## Installation

You need to follow 3 simple steps to get Copyhawk running on your site:

1. Add the js scripts to your site

    eyas.js
    polyfill.js (only required when older browsers need to be supported)

2. Add the init tag to your site

    <c-hawk-init data-site-token="" data-default-language="" data-supported-languages="" data-environment=""></c-hawk-init>

3. Add your script tags as your create them on Copyhawk

    <c-hawk data-label=""></c-hawk>

## Usage

All tokens required can be found within your Copyhawk account online. Go to [copyhawk's](https://app.copyhawk.co) site.

Usage is as simple as the three steps listed on section 1.

Advanced features include staging/preview mode.

`data-environment`
Using the preview data-environment, Copyhawk fetches Staged content instead of live content.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/copyhawk/js-sdk. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
