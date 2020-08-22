$(function(){

  const buildImg = (index, url)=> {
    const html = `<div data-index="${index}", class="items_edit-preview-box">
                    <div class="items_edit-upper-box">
                      <img class= "image${index} items_edit-input_images", data-index="${index}" src="${url}" width="100px" height="100px">
                      <div class="items_edit-js-remove">
                        削除
                      </div>
                    </div>
                  </div>`;
    return html;
  }

  const buildFileField = (num)=> {
    const html = `<div data-index="${num}" class="items_edit-js-file_group">
                    <input class="items_edit-js-file" type="file"
                    name="item[item_images_attributes][${num}][image]"
                    id="items_images_attributes_${num}_image"
                    style="display:none;">
                  </div>`;
    return html;
  }

  let fileIndex = [1,2,3,4,5,6,7,8,9,10];

  lastIndex = $('.items_edit-js-file_group:last').data('index');
  fileIndex.splice(0, lastIndex);

  $('.items_edit-hidden-destroy').hide();
  
  $('.items_edit-image-box').on('change', '.items_edit-js-file', function(e) {
    const targetIndex = $(this).parent().data('index');

    const file = e.target.files[0];
    const blobUrl = window.URL.createObjectURL(file);


    if (img = $(`img[data-index="${targetIndex}"]`)[0]) {
      img.setAttribute('image', blobUrl);
    } else {
      $('.items_edit-content').append(buildImg(targetIndex, blobUrl));

      $('.items_edit-lower-box__label').prepend(buildFileField(fileIndex[0]));
      $(this).css({'display':'none'});
      fileIndex.shift();

      fileIndex.push(fileIndex[fileIndex.length - 1] + 1);
    }
  });


  $('.items_edit-image-box').on('click', '.items_edit-js-remove', function() {
    const targetIndex = $(this).parent().parent().data('index');

    $(`.delete-check-box-${targetIndex}`).prop('checked', true);

    $(this).parent().parent().remove();
    $(`div[data-index="${targetIndex}"]`).remove();

    if ($('.items_edit-js-file').length == 0) $('.items_edit-lower-box__label').prepend(buildFileField(fileIndex[0]));
  });
});