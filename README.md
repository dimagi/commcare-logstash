# Ansible Role: Logstash setup for CommCare

## Testing locally

Requirements:
* Ruby (use [Ruby Version Manager](https://rvm.io/))
* Docker

1. `bundle install`

2. Run the tests

    `kitchen verify`

Run repeated tests:

    ```
    kitchen converge
    kitchen verify
    ```

Run tests manually:

    ```
    kitchen converge
    kitchen login

    $ cd /tmp/kitchen; /bin/sh -c /tmp/kitchen/test/test.sh
    ```
