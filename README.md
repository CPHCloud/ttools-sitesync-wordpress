# Wordpress Site Sync Module for Terminal Tools

Command line scripts for syncing Wordpress site assets and databases between 
local development environments to/from (or between) test/stage/live 
environments with [Terminal Tools](https://github.com/titledk/ttools-core)


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

