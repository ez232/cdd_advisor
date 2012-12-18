# Client-Designer Design Advisor

## Environment configuration on SRCF

### Setup RVM

- Install RVM:

```
\curl -L https://get.rvm.io | bash -s stable
```

- Put RVM into your path (change $USER to your username):

```
source /home/$USER/.rvm/scripts/rvm
```

- Check if RVM was installed correctly:

```
type rvm | head -n 1
```

It should print "rvm is a function".

- Install ruby 1.9.3

```
rvm install 1.9.3
```

- Check if ruby was installed correctly:

```
ruby --version
```

### Apache configuration

- Create a `.htaccess` file to proxy requests to the Thin web server that will
  be running locally:

```
cd public_html
nano .htaccess
```

- And write the following into the file:

```
RewriteEngine on
RewriteCond   %{REQUEST_FILENAME} !-f
RewriteRule   (.*) http://localhost:3232/$1 [P]
```

- `ctrl+x` and `Y` to save and exit nano editor.

### Getting the source

- Clone cdd_advisor git repository:

```
cd ..
git clone git://github.com/rflbras/cdd_advisor.git
```

### Setting up the application

- Install the dependencies:

```
cd cdd_advisor
bundle install
```

- Setup the database:

```
rake db:setup RAILS_ENV="production"
```

- Precompile the assets:

```
rake assets:precompile
```

- Start the Thin server:

```
rails server -e production -p 3232 -d
```


