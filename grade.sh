CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

cd student-submission

if ![[ -f `find ListExamples.java` ]]
then 
    echo "Please review the format of your submission. Our autograder could not find the right file."
    exit
else
then
    cp student-submission/*.java grading-area
    #cp list-examples-grader/TestListExamples.java grading-area #don't know if this will work
    cat grading-area
fi
#hopefully student java file and my tests are in grading-area

#to compile the java files
cd ./grading-area

javac -cp $CPATH ListExamples.java TestListsExamples.java 2>errors.txt
if ![[ $? == 0 ]]
then
    echo "Oh no"
    cat errors.txt
    exit
fi 


java -cp $CPATH org.junit.runner.JUnitCore ListExamples 
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples




# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
