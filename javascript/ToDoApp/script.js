document.addEventListener('DOMContentLoaded', function () {
    const taskList = document.getElementById('task-list');
    const taskInput = document.getElementById('new-task');
    const addTaskButton = document.getElementById('add-task');

    // Load tasks from localStorage
    function loadTasks() {
        const tasks = JSON.parse(localStorage.getItem('tasks')) || [];
        tasks.forEach(task => createTaskElement(task));
    }

    // Save tasks to localStorage
    function saveTasks() {
        const tasks = [];
        taskList.querySelectorAll('li').forEach(taskElement => {
            tasks.push(taskElement.firstChild.textContent);
        });
        localStorage.setItem('tasks', JSON.stringify(tasks));
    }

    // Create a task element
    function createTaskElement(taskText) {
        const newTask = document.createElement('li');
        newTask.innerHTML = `
            ${taskText}
            <button class="delete-task">Delete</button>
        `;

        taskList.appendChild(newTask);

        // Add delete functionality
        newTask.querySelector('.delete-task').addEventListener('click', function () {
            taskList.removeChild(newTask);
            saveTasks(); // Save tasks after deletion
        });
    }

    // Add a new task
    addTaskButton.addEventListener('click', function () {
        const taskText = taskInput.value.trim();
        
        if (taskText === '') {
            alert('Please enter a task.');
            return;
        }

        createTaskElement(taskText);
        saveTasks(); // Save tasks after adding

        // Clear the input field
        taskInput.value = '';
    });

    // Load the tasks from localStorage on page load
    loadTasks();
});
