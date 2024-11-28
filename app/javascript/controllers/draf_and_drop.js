import Sortable from 'sortablejs';

document.addEventListener('DOMContentLoaded', () => {
  const columns = document.querySelectorAll('.task-column');
  
  columns.forEach(column => {
    Sortable.create(column, {
      group: 'tasks',
      animation: 150,
      onEnd: function (evt) {
        const taskId = evt.item.dataset.taskId;
        const newStatus = evt.to.id.replace('-tasks', '');

        fetch(`/tasks/${taskId}`, {
          method: 'PATCH',
          headers: {
            'Content-Type': 'application/json',
            'X-CSRF-Token': document.querySelector('[name=csrf-token]').content
          },
          body: JSON.stringify({ task: { status: newStatus } })
        });
      }
    });
  });
});
