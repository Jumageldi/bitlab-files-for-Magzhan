package db;

import model.Tasks;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class DBManager {

    private static List<Tasks> tasksList = new ArrayList<>();
    private static Long idCounter = 1L;
    static {
        tasksList.add(new Tasks(generateId(), "Создать задачу", "Тестовая задача на создание", "25.12.2024", true));
        tasksList.add(new Tasks(generateId(), "Задачу создать", "На создание тестовая задача", "31.12.2024", false));

    }

    public static List<Tasks> getTasks() {
        return tasksList;
    }

    private static synchronized Long generateId() {
        return idCounter++;
    }

    public static void addTask(Tasks task){
        task.setId(generateId());
        tasksList.add(task);
    }

    public static Tasks getTask(Long id) {
        for (Tasks task : tasksList) {
            if (task.getId().equals(id)) {
                System.out.println("Found task with id " + id);
                return task;
            }
        }
        System.out.println("No task found with id " + id);
        return null;
    }


    public static Tasks updateTask(Tasks task){
        for (int i = 0; i < tasksList.size(); i++) {
            if (Objects.equals(task.getId(), tasksList.get(i).getId())){
                tasksList.set(i, task);
                return task;
            }
        }
        return null;
    }


    public static void deleteTask(Long id){
        for (int i = 0; i < tasksList.size(); i++) {
            if (tasksList.get(i).getId() == id) {
                tasksList.remove(i);
                System.out.println(i);
                break;
            }
        }
    }
}
