# A category on NSData for the creation of data: URIs

This category adds one public method to NSData instances to make it easy to create data: URIs. You pass in a MIME type (required by the data: URI spec) describing the type of data; it returns an NSURL object containing the URI.

Warning: The returned URI may be long (proportionally to the input data). Be careful where you output it, so as not to bury the user in seemingly garbage text.

This code was originally written for [a test app that tried to implement a QL Generator plug-in to handle data: URLs](https://github.com/boredzo/QLDataURLTest). That didn't work, but the category may be useful for other purposes.
