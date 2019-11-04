### Setup instructions

When developing the tutorial pages, it can be helpful to view the pages locally. First make sure you have all the dependencies 

    sudo gem install bundler
    brew install libxml2 libxslt
    sudo gem install nokogiri
    
_(Note: you may need to specify `--with-xml2-include=/usr/local/opt/libxml2/include` for nokogiri.)_

Then install the GitHub Jekyll dependencies locally

    bundle install --path vendor/bundle

Finally, run the local server

    ./local_server.sh

### Adding pages

1. Modify Matlab file with desired content
2. Run `osl_publish('filename.m')`. View locally using the local server if required
3. `git add .`, `git commit`, `git push`

And the live site should be updated immediately
