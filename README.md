1. Install Ruby
   First install the dependencies required for the RVM utility to build Ruby from source:

```bash
sudo apt update
sudo apt install curl g++, gcc, autoconf, automake, bison, libc6-dev, libffi-dev, libgdbm-dev, libncurses5-dev, libsqlite3-dev, libtool, libyaml-dev, make, pkg-config, sqlite3, zlib1g-dev, libgmp-dev, libreadline-dev, libssl-dev
```

Run the following commands to install RVM:

```
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
```

To start using RVM you need to run the following command:

```
source ~/.rvm/scripts/rvm
```

Install the latest stable version of Ruby with RVM and set it as the default version with:

```
rvm install 2.5.5
rvm use 2.5.5 --default
```

Verify that Ruby was properly installed by printing the version number:

```
ruby -v
```

You should see:

```
ruby 2.5.5p157 (2019-03-15 revision 67260) [x86_64-linux]
```

2. Install Jekyll

```
gem install jekyll bundler
```

If you want to test the site

```
bundle exec jekyll serve
```

3. Add the gh-pages worktree:

```
git worktree add _site gh-pages
```

4. Run deploy.sh
