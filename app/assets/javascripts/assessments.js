function createAssessment(user_id, track_id, stars) {
  $.ajax({
    url: 'http://localhost:3000/assessments.json',
    type: 'post',
    data: `user_id=${user_id}&track_id=${track_id}&stars=${stars}`,
    success: function(response) {
      if(response.status == 'success') {
        showAssessment(stars, response.message);
      }
    }
  });
}

function showAssessment(stars, message) {
  let ratingDiv = document.getElementById('rating');
  let presentAssessment = document.createElement('div');
  presentAssessment.className = "users-assessment";
  presentAssessment.innerHTML = message;
  ratingDiv.appendChild(presentAssessment);
}
