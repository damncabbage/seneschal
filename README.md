# Seneschal [![Build Status](https://travis-ci.org/damncabbage/seneschal.png)](https://travis-ci.org/damncabbage/seneschal)

(Pronounced _/ˈsɛnəʃəl/_, _"SEH-nah-shll"_, _"sene&lt;TAB&gt;"_, or _"I hate you please die"_.)

A command-line tool that manages services when developing in an <abbr title="Service-Oriented Architecture">SOA</abbr> environment.

## Installation

Requires Ruby 1.9.3+; installable with `gem install seneschal`. (Don't put it in your `Gemfile`; you'll be using this in the same way you use [Foreman](https://github.com/ddollar/foreman).)

## Usage

Define your service or application's dependencies in a `seneschal.json` in your application root:

```
~/projects-ui$ cat > seneschal.json <<EOF
{
  "dependencies": {
    "accounts-service": {
      "git": "git@github.com:example/accounts-service.git",
      "ref": "master",
      "env": "ACCOUNTS_SERVICE"
    }
    "projects-service": {
      "git": "git@github.com:example/projects-service.git",
      "ref": "v1.0.1",
      "env": "PROJECTS_SERVICE"
    }
  }
}
EOF
```

Run `seneschal start` to provision and then start up the services listed in the `seneschal.json` file. If you have a `Procfile` for the current application, it will start it too:

```
~/projects-ui$ seneschal start
* Provisioning accounts-service, example/accounts-service @ master...
* Provisioning projects-service, example/projects-service @ v1.0.1...
* Provisioning needed-by-projects-service, example/needed-by-projects-service @ v0.0.5...
* Starting project-ui...
* Starting accounts-service...
* Starting projects-service...
* Starting needed-by-projects-service...
```


## Notes

I was in a particularly misanthropic mood when I chose the name. Sorry.

## License

Copyright 2013, Rob Howard

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
