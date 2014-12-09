# Wordpress Site Sync Module for Terminal Tools

Command line scripts for syncing Wordpress site assets and databases between 
local development environments to/from (or between) test/stage/live 
environments with [Terminal Tools](https://github.com/titledk/ttools-core)


## Requirements

* [Terminal Tools](https://github.com/titledk/ttools-core) && [server sync core](https://github.com/titledk/ttools-serversync)
* We're expecting you're using [envWP](https://github.com/CPHCloud/envWP) for managing your 
environments - it might work without it though - let us know :)


## How to install `ttools` with sitesync-wordpress

This is an example of how `ttools` can be used to keep your local repo in sync with a dev server.

Start by setting up the sub modules:


	git submodule add git://github.com/titledk/ttools-core.git
	git submodule add git://github.com/titledk/ttools-githelpers.git #is not absolutely necessary, but you'll want it for deployment
	git submodule add git://github.com/titledk/ttools-sitesync-core.git
	git submodule add git://github.com/CPHCloud/ttools-sitesync-wordpress.git
	
Add something along the following lines to your `ttools-config.yml`:

    Menu:
      Heading1:
        Title: Local
        Item1:
          Title: Overwrite Local Site with Database & Assets from Dev Site
          Command: "ttools-sitesync-wordpress/local/overwrite-current-with-remote.sh"
    
    ServerSync:
      FrameworkModule: 'ttools-sitesync-wordpress'


That's it. In order for this to work, you'll need to have a `Dev` environment set up - see 
<https://github.com/titledk/ttools-core#configuration-example> for info on how to do that.




## Bundled software

### WP-CLI

See <http://wp-cli.org>. The entire `wp-cli.phar` has been added to
the repository to make deployments as little painful as possible.

#### Updating WP-CLI

	cd thirdparty
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

