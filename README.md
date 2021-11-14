# API Testing framework

1. Clone project
- cmd: git clone https://github.com/dglequang/APITest.git

2. Run a single test
- cmd: mvn clean test "-Dkarate.options=--tags @feature1" -Dtest=TestRunner

3. Run all scenarios in feature file
- cmd: mvn clean test -Dtest=TestRunner

4. View Cucumber report
- Go to folder: src/target/cucumber-html-reports, open file: overview-features.html
