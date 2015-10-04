# matviewdemo

This is the repository that accompanies the Materialized Views in PostgreSQL and Rails. 

If you want to run the app and you have docker/boot2docekr installed, type

    docker-compose up

and it should fire up on port 3000. You can then run a console with

    docker-compose run web rails c

And `load './bm.rb'` to see the benchmarks.
