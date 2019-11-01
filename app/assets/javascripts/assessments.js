function createAssessment(user_id, type, id,  stars) {
  $.ajax({
    url: 'http://localhost:3000/assessments.json',
    type: 'post',
    data: `user_id=${user_id}&object_id=${id}&object_type=${type}&stars=${stars}`
  });
}

function getStars(object_id, object_type, user_id) {
  $.ajax({
    url: 'http://localhost:3000/assessment.json',
    type: 'get',
    data: `object_id=${object_id}&object_type=${object_type}&user_id=${user_id}`,
    success: function(response) {
      if(response.status == 'success') {
        starsBehavior(response.stars, object_id);
      } else {
        starsBehavior(stars = 0, object_id);
      }
    }
  });
}
