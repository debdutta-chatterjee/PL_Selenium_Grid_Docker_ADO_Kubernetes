:: start the grid with 2 chrome containers
docker-compose -f grid.yaml up --scale chrome=2 -d

:: run test suites with chrome
SET BROWSER=chrome 
call  docker-compose up

:: stop chrome and run firefox containers
docker-compose -f grid.yaml up --scale firefox=2 -d

:: run test suites with firefox
SET BROWSER=firefox 
call  docker-compose up

:: bring down all
call docker-compose -f grid.yaml down
call  docker-compose down