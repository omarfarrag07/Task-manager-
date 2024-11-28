import consumer from "./consumer"

document.addEventListener('turbo:load', () => {
  const projectId = document.getElementById('task-board').dataset.projectId;

  consumer.subscriptions.create({ channel: "TaskBoardChannel", project_id: projectId }, {
    received(data) {
      const taskBoard = document.getElementById('task-board');
      
      switch(data.action) {
        case 'create':
          taskBoard.insertAdjacentHTML('beforeend', data.task);
          break;
        case 'update':
          const taskElement = document.querySelector(`[data-task-id="${data.task.id}"]`);
          if (taskElement) taskElement.outerHTML = data.task;
          break;
        case 'destroy':
          const taskToRemove = document.querySelector(`[data-task-id="${data.task_id}"]`);
          if (taskToRemove) taskToRemove.remove();
          break;
      }
    }
  });
});
