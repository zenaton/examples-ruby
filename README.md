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

## Example 1 : Sequential tasks execution
[This example](https://github.com/zenaton/examples-ruby/tree/master/workflows/sequential_workflow.rb) showcases
- a sequential execution of two tasks. The second task is executed only when the first one is processed.
- In a sequential task execution, you can get the output of a task. The result of the first task can be used by the second one.

<p align="center">
    <img src="https://raw.githubusercontent.com/zenaton/resources/master/examples/images/png/flow_sequential.png" alt="Sequential Workflow Diagram" />
</p>

```ruby
ruby launch_sequential.rb
```

## Example 2: Parallel tasks execution
[This example](https://github.com/zenaton/examples-ruby/tree/master/workflows/parallel_workflow.rb) showcases
- a parallel execution of 2 tasks
- a third task that is executed only after *both* first two tasks were processed

<p align="center">
    <img src="https://raw.githubusercontent.com/zenaton/resources/master/examples/images/png/flow_parallel.png" alt="Parallel Workflow Diagram" />
</p>

```ruby
ruby launch_parallel.rb
```

## Example 3: Asynchronous tasks execution
[this example](https://github.com/zenaton/examples-ruby/tree/master/workflows/asynchronous_workflow.rb) showcases
- An asynchronous execution of a task A (fire and forget)
- Then a sequential execution of Task B

<p align="center">
    <img src="https://raw.githubusercontent.com/zenaton/resources/master/examples/images/png/flow_async.png" alt="Asynchronous Workflow Diagram" />
</p>

```ruby
ruby launch_asynchronous.rb
```

When a task is dispatched asynchronously, the workflow continues its execution without waiting for the task completion. Consequently, a task asynchronous dispatching always returns a null value.

## Example 4: Event
[This example](https://github.com/zenaton/examples-ruby/tree/master/workflows/event_workflow.rb) showcases
- how to change a workflow's behaviour based on an external event

<p align="center">
    <img src="https://raw.githubusercontent.com/zenaton/resources/master/examples/images/png/flow_react_event.png" alt="Event Workflow Diagram" />
</p>

```ruby
ruby launch_event.rb
```

## Example 5: Wait
[This example](https://github.com/zenaton/examples-ruby/tree/master/workflows/wait_workflow.rb) showcases
- how the provided `Wait` task can be used to pause the workflow for a specified duration

<p align="center">
    <img src="https://raw.githubusercontent.com/zenaton/resources/master/examples/images/png/flow_wait.png" alt="Wait Workflow Diagram" />
</p>

```ruby
ruby launch_wait.rb
```

## Example 6: Wait Event
[This example](https://github.com/zenaton/examples-ruby/tree/master/workflows/wait_event_workflow.rb) showcases
- how the provided `Wait` task can also be used to pause the workflow up to receiving a specific external event

<p align="center">
    <img src="https://raw.githubusercontent.com/zenaton/resources/master/examples/images/png/flow_wait_event.png" alt="WaitEvent Workflow Diagram" />
</p>

```ruby
ruby launch_wait_event.rb
```

## Example 7: Error Workflow
[This example](https://github.com/zenaton/examples-ruby/tree/master/workflows/error_workflow.rb) showcases
- how to recover from a faulty task

<p align="center">
    <img src="https://raw.githubusercontent.com/zenaton/resources/master/examples/images/png/flow_error.png" alt="Error Workflow Diagram" />
</p>

```ruby
ruby launch_error.rb
```

## Example 8: Recursive Workflow
[This example](https://github.com/zenaton/examples-ruby/tree/master/recursive/recursive_workflow.rb) showcases
- how launching events or workflows directly from orchestrated tasks allows you to schedule recurring workflows

```ruby
ruby launch_recursive.rb
```

## Example 9: Workflow Versions
[This example](https://github.com/zenaton/examples-ruby/tree/master/workflows/version_workflow.rb) showcases
- how to update your workflow implementation, even while previous versions are still running

```ruby
ruby launch_version.rb
```
