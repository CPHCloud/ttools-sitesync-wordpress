# Wordpress Sync Module for Terminal Tools

This module can help working locally with Wordpress, as it can:

* Push your local database and assets to a test server (Live is not allowed)
* Pull changes from a live/test/dev server down on you local machine
* Does all this via the command line, leveraging `Terminal Tools` and Wordpress CLI tools


## Requirements

* [Terminal Tools](https://github.com/titledk/ttools-core) && [server sync core](https://github.com/titledk/ttools-serversync)
* We're expecting you're using [envWP](https://github.com/CPHCloud/envWP) for managing your 
environments - it might use without it though - let us know :)



## Bundled software

### WP-CLI

See <http://wp-cli.org>. The entire `wp-cli.phar` has been added to
the repository to make deployments as little painful as possible.

#### Updating WP-CLI

	cd thirdparty
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

