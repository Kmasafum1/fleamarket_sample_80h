$(function(){
  $('.category').on('change',(function() {
    $(".categorychild").show();
    let value = $('.category').val();
    $.ajax({      
      type: "GET",
      url: '/exhibition/category_children',
      data: { id: value },
      dataType: 'json'
    })
    .done(function(children){ 
      $('.categorychild').empty();
      children.forEach(function(child) {
        $('.categorychild').append(`<option value="${child.id}"> ${child.name} </option>`)
        
      })
    });
  }))
})
$(function(){
  $('.categorychild').on('change', (function(){
    $(".categorygrandchild").show();
    let value = $('.categorychild').val();
    $.ajax({      
      type: "GET",
      url: '/exhibition/category_grandchildren',
      data: { id: value },
      dataType: 'json'
    })
    .done(function(children){ 
      $('.categorygrandchild').empty();
      children.forEach(function(child) {    
        $('.categorygrandchild').append(`<option > ${child.name} </option>`) 
      })
    });
  }))
})