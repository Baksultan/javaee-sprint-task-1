package db;

import java.util.ArrayList;

public class DBManager {

    private static final ArrayList<Task> tasks = new ArrayList<>();

    static {
        tasks.add(new Task(1L, "Create a Java EE Web Application", "Create a Java EE Web Application","2023-04-23", "Yes"));
        tasks.add(new Task(2L, "Clean up the house and buy groceries", "Clean up the house and buy groceries","2023-05-21", "Yes"));
        tasks.add(new Task(3L, "Complete all homework", "Complete all homework","2023-06-20", "No"));
        tasks.add(new Task(4L, "Sign up for a gym", "Sign up for a gym","2023-07-24", "No"));
        tasks.add(new Task(5L, "Learn Italian", "Learn Italian","2023-08-25", "No"));
    }

    public static void addTask(Task task) {
        task.setId((long) (tasks.size()+1));
        tasks.add(task);
    }

    public static Task getTask(Long id) {
        return tasks.get(Math.toIntExact(id));
    }

    public static ArrayList getAllTasks() {
        return tasks;
    }

    public static void deleteTask(int id) {
        for (int i=0; i<tasks.size(); i++) {
            if (tasks.get(i).getId() == id) {
                for (int j=i+1; j<tasks.size(); j++) {
                    tasks.get(j).setId(tasks.get(j).getId() - 1);
                }
                tasks.remove(i);
                break;
            }
        }
    }
}
