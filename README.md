# Ansible Role: Logstash setup for CommCare

## Testing locally

Requirements:
* Ruby (use [Ruby Version Manager](https://rvm.io/))
* Docker

1. `bundle install`

2. Run the tests

    ```python
    kitchen test
    ```
   
    You can also run tests manually:

    ```
    kitchen create
    kitchen converge
    kitchen verify
    kitchen exec -c 'sudo /tmp/kitchen/test/test.sh'
    ```

    OR
   
    ```
    kitchen create
    kitchen converge
    kitchen login
    $ sudo /tmp/kitchen/test/test.sh 
    ```

    After each change you will need to run `kitchen converge` again before re-running the
    test command.

## Build & Release
1. Build the collection with ansible-galaxy command from project root folder
   ```
   ansible-galaxy collection build
   ```

2. Upload the generated zip file when doing a github release

## References

* [Grok patterns](https://github.com/logstash-plugins/logstash-patterns-core/blob/master/patterns/grok-patterns)
* [Grok Debugger](https://grokdebug.herokuapp.com/)
