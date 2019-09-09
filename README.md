# Zenaton examples for Ruby
This repository contains examples of workflows built with Zenaton. These examples illustrates how Zenaton orchestrates tasks that are executed on different workers.

## Installation
Download this repo
```
git clone https://github.com/zenaton/examples-ruby.git; cd examples-ruby
```
then add an .env file
```
cp .env.example .env
```
and populate it with your application id and api token found [here](https://zenaton.com/app/api).

### Running on Docker
Simply run
```
docker-compose build; docker-compose up
```

You're all set!

### Running Locally
Install dependencies
```
bundle install
```
Then, you need to install a Zenaton worker
```
curl https://install.zenaton.com | sh
```
and start it, and make it listen to your configuration:
```
zenaton start; zenaton listen --env=.env --boot=boot.rb
```
Your all set!


*Your workflows will be processed by your worker, so you won't see anything except the stdout and stderr, respectively `zenaton.out` and `zenaton.err`. Look at these files :)*

## Example 1 : Single task execution
[This example](https://github.com/zenaton/examples-ruby/tree/master/tasks/task_a.rb) showcases
- An execution of a single task

```ruby
ruby launch_single_task.rb
```

## Example 2 : Sequential tasks execution
[This example](https://github.com/zenaton/examples-ruby/tree/master/workflows/sequential_workflow.rb) showcases
- a sequential execution of three tasks. The second and third tasks are executed only when the previous one is processed.
- In a sequential task execution, you can get the output of a task. The result of a task can be used by the next one.

<p align="center">
  <img
    src="https://raw.githubusercontent.com/zenaton/resources/master/examples/images/png/flow_sequential.png"
    width="324px"
    alt="Sequential Workflow Diagram"
  />
  <img src="https://user-images.githubusercontent.com/36400935/58274921-30de0800-7d94-11e9-8e01-47d63f341147.gif" width="400px"/>
</p>

```ruby
ruby launch_sequential.rb
```

## Example 3: Parallel tasks execution
[This example](https://github.com/zenaton/examples-ruby/tree/master/workflows/parallel_workflow.rb) showcases
- a parallel execution of 2 tasks
- a third task that is executed only after *both* first two tasks were processed

<p align="center">
  <img
    src="https://raw.githubusercontent.com/zenaton/resources/master/examples/images/png/flow_parallel.png"
    width="324px"
    alt="Parallel Workflow Diagram"
  />
  <img src="https://user-images.githubusercontent.com/36400935/58277197-751fd700-7d99-11e9-8fff-d7c483c8abaf.gif" width="400px"/>
</p>

```ruby
ruby launch_parallel.rb
```

## Example 4: Asynchronous tasks execution
[this example](https://github.com/zenaton/examples-ruby/tree/master/workflows/asynchronous_workflow.rb) showcases
- Asynchronous executions of Task A and Task B (fire and forget)
- Then sequential executions of Task C and Task D

<p align="center">
  <img
    src="https://raw.githubusercontent.com/zenaton/resources/master/examples/images/png/flow_async.png"
    width="324px"
    alt="Asynchronous Workflow Diagram"
  />
  <img src="https://user-images.githubusercontent.com/36400935/58277203-78b35e00-7d99-11e9-9ae8-cfa92757623f.gif" width="400px"/>
</p>

```ruby
ruby launch_asynchronous.rb
```

When a task is dispatched asynchronously, the workflow continues its execution without waiting for the task completion. Consequently, a task asynchronous dispatching always returns a null value.

## Example 5: Event
[This example](https://github.com/zenaton/examples-ruby/tree/master/workflows/event_workflow.rb) showcases
- how to change a workflow's behaviour based on an external event

<p align="center">
  <img
    src="https://raw.githubusercontent.com/zenaton/resources/master/examples/images/png/flow_react_event.png"
    width="324px"
    alt="Event Workflow Diagram"
  />
  <img src="https://user-images.githubusercontent.com/36400935/58276729-769ccf80-7d98-11e9-8ebc-d70ec82dd73b.gif" width="400px"/>
</p>

```ruby
ruby launch_event.rb
```

## Example 6: Wait
[This example](https://github.com/zenaton/examples-ruby/tree/master/workflows/wait_workflow.rb) showcases
- how the provided `Wait` task can be used to pause the workflow for a specified duration

<p align="center">
  <img
    src="https://raw.githubusercontent.com/zenaton/resources/master/examples/images/png/flow_wait.png"
    width="324px"
    alt="Wait Workflow Diagram"
  />
  <img src="https://user-images.githubusercontent.com/36400935/58276731-78669300-7d98-11e9-97b7-fbe0a39ecba0.gif" width="400px"/>
</p>

```ruby
ruby launch_wait.rb
```

## Example 7: Wait Event
[This example](https://github.com/zenaton/examples-ruby/tree/master/workflows/wait_event_workflow.rb) showcases
- how the provided `Wait` task can also be used to pause the workflow up to receiving a specific external event

<p align="center">
  <img
    src="https://raw.githubusercontent.com/zenaton/resources/master/examples/images/png/flow_wait_event.png"
    width="324px"
    alt="WaitEvent Workflow Diagram"
  />
  <img src="https://user-images.githubusercontent.com/36400935/58277648-7ac9ec80-7d9a-11e9-9b7b-58ca65809d00.gif" width="400px"/>
</p>

```ruby
ruby launch_wait_event.rb
```

## Example 8: Error Workflow
[This example](https://github.com/zenaton/examples-ruby/tree/master/workflows/error_workflow.rb) showcases
- how to recover from a faulty task

<p align="center">
  <img
    src="https://raw.githubusercontent.com/zenaton/resources/master/examples/images/png/flow_error.png"
    width="324px"
    alt="Error Workflow Diagram"
  />
  <img src="https://user-images.githubusercontent.com/36400935/58315058-1007c800-7e11-11e9-8bbb-7b1fb8e5bdbb.gif" width="400px"/>
</p>

```ruby
ruby launch_error.rb
```

## Example 9: Recursive Workflow
[This example](https://github.com/zenaton/examples-ruby/tree/master/recursive/recursive_workflow.rb) showcases
- how launching events or workflows directly from orchestrated tasks allows you to schedule recurring workflows

```ruby
ruby launch_recursive.rb
```

## Example 10: Workflow Versions
[This example](https://github.com/zenaton/examples-ruby/tree/master/workflows/version_workflow.rb) showcases
- how to update your workflow implementation, even while previous versions are still running

```ruby
ruby launch_version.rb
```

## Example 11: Automatic retry of failed tasks
[This example](https://github.com/zenaton/examples-ruby/tree/master/tasks/task_with_retry.rb) showcases
- how a failed task can be retried automatically
- how to customize the automatic retry policy
 
```ruby
ruby launch_automatic_retry.rb
```

## Example 12: Schedule a task
[This example](https://github.com/zenaton/examples-ruby/tree/master/schedule_task_a.rb) showcases
- how to schedule a task to make it run periodically

```ruby
ruby schedule_task_a.rb
```
