function createAssessment(user_id, track_id, stars) {
  $.ajax({
    url: 'http://localhost:3000/assessments.json',
    type: 'post',
    data: `user_id=${user_id}&track_id=${track_id}&stars=${stars}`
  });
}
