function createAssessment(user_id, track_id, stars) {
  $.ajax({
    url: 'http://localhost:3000/assessments.json',
    type: 'post',
    data: `user_id=${user_id}&track_id=${track_id}&stars=${stars}`
  });
}

function getStars(track_id, user_id) {
  $.ajax({
    url: 'http://localhost:3000/assessment.json',
    type: 'get',
    data: `track_id=${track_id}&user_id=${user_id}`,
    success: function(response) {
      if(response.status == 'success') {
        starsBehavior(response.stars, track_id);
      } else {
        starsBehavior(stars = 0, track_id);
      }
    }
  });
}
