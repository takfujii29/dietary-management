$(function(){
  function addFood(food) {
    let html = `
        <div class="form-food">
          <p class="form-food__name">${food.name}</p>
          <div class="food-search-add form-food__btn form-food__btn--add" data-food-id="${food.id}" data-food-name="${food.name}">追加</div>
        </div>
      `;
      $("#food-search-result").append(html);
    }
  
    function addNoFood() {
      let html = `
        <div class="form-food">
          <p class="form-food__name">食べ物が見つかりません</p>
        </div>
      `;
      $("#food-search-result").append(html);
    }
    function addDeleteFood(name, id) {
      let html = `
      <div class="form-food" id="${id}">
        <p class="form-food__name">${name}</p>
        <div class="food-search-remove form-food__btn form-food__btn--remove js-remove-btn" data-food-id="${id}" data-food-name="${name}">削除</div>
      </div>`;
      $(".js-add-food").append(html);
    }
    function addManagement(foodId) {
      let html = `<input value="${foodId}" name="management[food_ids][]" type="hidden" id="management_food_ids_${foodId}" />`;
      $(`#${foodId}`).append(html);
    }
  $('#food-search-field').on('keyup', function() {
    let input = $('#food-search-field').val();
    $.ajax({
      type: 'GET',
      url: '/managements/new',
      data: { keyword: input },
      dataType: 'json'
    })
      .done(function(foods) {
        console.log
        $('#food-search-result').empty();
        
        if (foods.length !== 0) {
          foods.forEach(function(food) {
            addFood(food);
          });
        } else if (input.length == 0) {
          return false;
        } else {
          addNoFood();
        }
      })
      .fail(function() {
        alert('該当する食べ物が登録されていません');
      });
  });
  $(document).on("click", ".form-food__btn--add", function() {
    console.log
    const foodName = $(this).attr("data-food-name");
    const foodId = $(this).attr("data-food-id");
    $(this)
      .parent()
      .remove();
    addDeleteFood(foodName, foodId);
    addManagement(foodId);
  });
  $(document).on("click", ".form-food__btn--remove", function() {
    $(this)
      .parent()
      .remove();
  });
});