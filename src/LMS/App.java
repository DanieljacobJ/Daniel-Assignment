package LMS;


import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class App {
    //Sorting using Comparator Day 1

    public static void main(String[] args) {
        Course c1 = new Course(101, "Java", 15000);
        Course c2 = new Course(102, "Python", 12000);
        Course c3 = new Course(103, "React", 15000);
        Course c4 = new Course(104, "SQL", 8000);
        Course c5 = new Course(105, "Angular", 1200);

        List<Course> list = new ArrayList<>(); // creating a container
        list.add(c1);
        list.add(c2);
        list.add(c3);
        list.add(c4);
        list.add(c5);
        System.out.println("Total Number of Courses: " + list.size());
        System.out.println("courses in unsorted order");
        for(Course c : list){
            System.out.println(c);
        }
        System.out.println("Ascending Order By Fee");
        sortCourses(list, "ASC");
        System.out.println("Descending order By Fee");
        sortCourses(list, "DESC");
    }

    private static void sortCourses(List<Course> list,String direction) {
        Collections.sort(list , new CourseUtility(direction));
        for(Course c : list){
            System.out.println(c);
        }
    }
}