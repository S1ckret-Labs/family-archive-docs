# History of decisions

## Tools, Programming languages

> 2023/07/22

It was decided to use

- Svelte for frontend, because it has excellent support for native JS libraries and has ease and speed for prototyping.
- Go for backend, because it is fast, lightweight, easy to prototype in.
- also we want to learn these technologies

It was decided to use MySQL database, because it is the simplest and the most reliable way of storing data and relationships. A lot of inspiration was taken from "SQL Antipatterns: Avoiding the Pitfalls of Database Programming" by Bill Karwin.

## Deployment

> 2023/07/22

We are considering to host entire solution serverless while we don't have any users. When usage pattern emerges we should be ready to migrate to server based solution (if it is cheaper).

For web server we will use AWS Lambda with AWS API Gateway. 

For database we should consider PlanetScale or Turso for prototyping and early hosting.

For SPA we will use Amazon S3 and Amazon CloudFront.
