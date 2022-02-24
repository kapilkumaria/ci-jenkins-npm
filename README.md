# Project One	
Infrastructure is best represented as code, and the provisioning of resources should be automated as much as possible.	

The task here is to create a CI build pipeline that deploys this web application to a load-balanced	
environment.

 * The CI job should:	
  * Run when a feature branch is pushed to Github (you should fork this repository to your Github account).
  * Deploy to a target environment when the job is successful.	
* The target environment should consist of:	
  * A load-balancer accessible via HTTP on port 80.	
  * Two application servers (this repository) accessible via HTTP on port 3000.	
* The load-balancer should use a round-robin strategy.	
* The application server should return the response "Hi there! I'm being served from {hostname}!".	

 ## Context	
The aim of this is to test your ability to implement modern automated infrastructure, as well as your general knowledge of system administration. In your solution you should emphasize readability, maintainability and DevOps methodologies.	

 ## Submit your solution	
Create a public Github repository and push your solution in it. Commit often - we would rather see a history of trial and error than a single monolithic push. When you're finished, send us the URL to the repository.	

 ## Running this web application	
 This is a NodeJS application:

- `npm test` runs the application tests	- `npm test` runs the application tests
- `npm start` starts the http server
