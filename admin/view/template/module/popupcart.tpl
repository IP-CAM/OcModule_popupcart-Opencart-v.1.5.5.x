<?php echo $header; ?>
<style type="text/css">
  .box-footer{
    height: 29px;
    padding-left: 7px;
    padding-right: 7px;
    border: 1px solid #DBDBDB;
    background: url('/admin/view/image/box.png') repeat-x;
    /* -webkit-border-radius: 0px 7px 0px 0px; */
    -moz-border-radius: 7px 7px 0px 0px;
    -khtml-border-radius: 7px 7px 0px 0px;
    /* border-radius: 7px 7px 0px 0px; */
    padding-top: 9px;
    text-align: center;
  }
</style>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($success) { ?>
  <div class="success"><?php echo $success; ?></div>
  <?php } ?>

  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons">
        <a onclick="$('#form').append('<input type=hidden value=save_exit name=action />');$('#form').submit();" class="button"><?php echo $lang->get('button_save_exit'); ?></a>
        <a onclick="$('#form').submit();" class="button"><?php echo $lang->get('button_save'); ?></a>
        <a onclick="location = '<?php echo $cancel; ?>';" class="button"><?php echo $lang->get('button_cancel'); ?></a>
      </div>
    </div>
    <div class="content">
      <form action="<?php echo $action; ?>" method="post" id="form">
       <div id="tabs" class="htabs"><a href="#tab_general"><?php echo $lang->get('tab_general'); ?></a><a href="#tab_settings"><?php echo $lang->get('tab_settings'); ?></a></div>
        <div id="tab_general">
          <table id="module" class="list">
              <thead>
                <tr>
                  <td class="left"><?php echo $lang->get('entry_layout'); ?></td>
                  <td class="left"><?php echo $lang->get('entry_position'); ?></td>
                  <td class="left"><?php echo $lang->get('entry_status'); ?></td>
                  <td class="right"><?php echo $lang->get('entry_sort_order'); ?></td>
                  <td></td>
                </tr>
              </thead>
              <?php $module_row = 0; ?>
              <?php if( ! empty($modules) ): ?>
              <?php foreach ($modules as $module) { ?>
              <tbody id="module-row<?php echo $module_row; ?>">
                <tr>
                  <td class="left"><select name="popupcart_module[<?php echo $module_row; ?>][layout_id]">
                      <?php foreach ($layouts as $layout) { ?>
                      <?php if ($layout['layout_id'] == $module['layout_id']) { ?>
                      <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                      <?php } else { ?>
                      <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                      <?php } ?>
                      <?php } ?>
                    </select></td>
                  <td class="left"><select name="popupcart_module[<?php echo $module_row; ?>][position]">
                      <?php if ($module['position'] == 'content_top') { ?>
                      <option value="content_top" selected="selected"><?php echo $lang->get('text_content_top'); ?></option>
                      <?php } else { ?>
                      <option value="content_top"><?php echo $lang->get('text_content_top'); ?></option>
                      <?php } ?>
                      <?php if ($module['position'] == 'content_bottom') { ?>
                      <option value="content_bottom" selected="selected"><?php echo $lang->get('text_content_bottom'); ?></option>
                      <?php } else { ?>
                      <option value="content_bottom"><?php echo $lang->get('text_content_bottom'); ?></option>
                      <?php } ?>
                      <?php if ($module['position'] == 'column_left') { ?>
                      <option value="column_left" selected="selected"><?php echo $lang->get('text_column_left'); ?></option>
                      <?php } else { ?>
                      <option value="column_left"><?php echo $lang->get('text_column_left'); ?></option>
                      <?php } ?>
                      <?php if ($module['position'] == 'column_right') { ?>
                      <option value="column_right" selected="selected"><?php echo $lang->get('text_column_right'); ?></option>
                      <?php } else { ?>
                      <option value="column_right"><?php echo $lang->get('text_column_right'); ?></option>
                      <?php } ?>
                    </select></td>
                  <td class="left"><select name="popupcart_module[<?php echo $module_row; ?>][status]">
                      <?php if ($module['status']) { ?>
                      <option value="1" selected="selected"><?php echo $lang->get('text_enabled'); ?></option>
                      <option value="0"><?php echo $lang->get('text_disabled'); ?></option>
                      <?php } else { ?>
                      <option value="1"><?php echo $lang->get('text_enabled'); ?></option>
                      <option value="0" selected="selected"><?php echo $lang->get('text_disabled'); ?></option>
                      <?php } ?>
                    </select></td>
                  <td class="right"><input type="text" name="popupcart_module[<?php echo $module_row; ?>][sort_order]" value="<?php echo $module['sort_order']; ?>" size="3" /></td>
                  <td class="left"><a onclick="$('#module-row<?php echo $module_row; ?>').remove();" class="button"><?php echo $lang->get('button_remove'); ?></a></td>
                </tr>
              </tbody>
              <?php $module_row++; ?>
              <?php } ?>
              <?php endif; ?>
              <tfoot>
                <tr>
                  <td colspan="4"></td>
                  <td class="left"><a onclick="addModule();" class="button"><?php echo $lang->get('button_add_module'); ?></a></td>
                </tr>
              </tfoot>
            </table>
        </div>
        <div id="tab_settings">
          <h2><?php echo $lang->get('text_popupcart_settings_modal'); ?></h2>
          <table class="form">
            <tr>
              <td> <?php echo $lang->get('text_popupcart_title_text'); ?></td>
              <td> <input type="text" name="popupcart_title_text" value="<?php echo $popupcart_title_text; ?>" size="64" /> </td>
            </tr>
            <tr>
              <td> <?php echo $lang->get('text_popupcart_image_width'); ?> </td>
              <td> <input type="text" name="popupcart_image_width" value="<?php echo !empty($popupcart_image_width)? $popupcart_image_width : "100"; ?>" /> </td>
            </tr>
            <tr>
              <td> <?php echo $lang->get('text_popupcart_image_height'); ?> </td>
              <td> <input type="text" name="popupcart_image_height" value="<?php echo !empty($popupcart_image_height)? $popupcart_image_height : "100"; ?>" /> </td>
            </tr>
            <tr>
              <td> <?php echo $lang->get('text_popupcart_title_draggable'); ?></td>
              <td>
                <select name="popupcart_title_draggable" id="">
                  <option value="1" <?php echo $popupcart_title_draggable?'selected="selected"':''; ?>><?php echo $lang->get('text_yes'); ?></option>
                  <option value="0" <?php echo $popupcart_title_draggable==0?'selected="selected"':''; ?>><?php echo $lang->get('text_no'); ?></option>
                </select>
              </td>
            </tr>
            </table>
            <h2><?php echo $lang->get('text_popupcart_settings_recommend'); ?></h2>
            <table class="form">
              <tr>
                <td><?php echo $lang->get('text_popupcart_title_recommend') ?></td>
                <td><input type="text" name="popupcart_title_recommend" value="<?php echo $popupcart_title_recommend; ?>" size="64"></td>
              </tr>
              <tr>
                <td><?php echo $lang->get('text_popupcart_show_recommend'); ?></td>
                <td>
                  <select name="popupcart_show_recommend" id="">
                    <option value="1" <?php echo $popupcart_show_recommend ?'selected="selected"':''; ?>><?php echo $lang->get('text_yes'); ?></option>
                    <option value="0" <?php echo  ! $popupcart_show_recommend ?'selected="selected"':''; ?>><?php echo $lang->get('text_no'); ?></option>
                  </select>                
                </td>
              </tr>              
              <tr>
                <td><?php echo $lang->get('text_popupcart_types_recommend'); ?></td>
                <td>
                  <select name="popupcart_type_recommend" id="">
                    <?php foreach ($popupcart_types_recommend as $type): ?>
                      <option value="<?php echo $type; ?>" <?php echo ! empty($popupcart_type_recommend) && $popupcart_type_recommend == $type ? 'selected': ''; ?>><?php echo $lang->get('text_popupcart_type_' . $type); ?></option>
                    <?php endforeach ?>
                  </select>                
                </td>
              </tr>              
              <tr>
                <td><?php echo $lang->get('text_popupcart_limit_recommend') ?></td>
                <td><input type="text" name="popupcart_limit_recommend" value="<?php echo $popupcart_limit_recommend; ?>" size="64"></td>
              </tr>
            </table>
            <h2><?php echo $lang->get('text_popupcart_settings_fields'); ?></h2>
            <table class="form">
              <tr>
                <td><?php echo $lang->get('text_popupcart_field_model'); ?></td>
                <td>
                  <select name="popupcart_field_model" id="">
                    <option value="1" <?php echo $popupcart_field_model ?'selected="selected"':''; ?>><?php echo $lang->get('text_yes'); ?></option>
                    <option value="0" <?php echo  ! $popupcart_field_model ?'selected="selected"':''; ?>><?php echo $lang->get('text_no'); ?></option>
                  </select>                
                </td>
              </tr>
              <tr>
                <td><?php echo $lang->get('text_popupcart_field_sku'); ?></td>
                <td>
                  <select name="popupcart_field_sku" id="">
                    <option value="1" <?php echo $popupcart_field_sku ?'selected="selected"':''; ?>><?php echo $lang->get('text_yes'); ?></option>
                    <option value="0" <?php echo  ! $popupcart_field_sku ?'selected="selected"':''; ?>><?php echo $lang->get('text_no'); ?></option>
                  </select>                
                </td>
              </tr>
            </table>
        </div>
      </form>

        <div class="box-footer">
          <?php echo $popupcart_footer; ?>
        </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
var module_row = <?php echo $module_row; ?>;

function addModule() {  
  html  = '<tbody id="module-row' + module_row + '">';
  html += '  <tr>';
  html += '    <td class="left"><select name="popupcart_module[' + module_row + '][layout_id]">';
  <?php foreach ($layouts as $layout) { ?>
  html += '      <option value="<?php echo $layout['layout_id']; ?>"><?php echo addslashes($layout['name']); ?></option>';
  <?php } ?>
  html += '    </select></td>';
  html += '    <td class="left"><select name="popupcart_module[' + module_row + '][position]">';
  html += '      <option value="content_top"><?php echo $lang->get('text_content_top'); ?></option>';
  html += '      <option value="content_bottom"><?php echo $lang->get('text_content_bottom'); ?></option>';
  html += '      <option value="column_left"><?php echo $lang->get('text_column_left'); ?></option>';
  html += '      <option value="column_right"><?php echo $lang->get('text_column_right'); ?></option>';
  html += '    </select></td>';
  html += '    <td class="left"><select name="popupcart_module[' + module_row + '][status]">';
    html += '      <option value="1" selected="selected"><?php echo $lang->get('text_enabled'); ?></option>';
    html += '      <option value="0"><?php echo $lang->get('text_disabled'); ?></option>';
    html += '    </select></td>';
  html += '    <td class="right"><input type="text" name="popupcart_module[' + module_row + '][sort_order]" value="" size="3" /></td>';
  html += '    <td class="left"><a onclick="$(\'#module-row' + module_row + '\').remove();" class="button"><?php echo $lang->get('button_remove'); ?></a></td>';
  html += '  </tr>';
  html += '</tbody>';
  
  $('#module tfoot').before(html);
  
  module_row++;
}
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs(); 
//--></script> 
<?php echo $footer; ?>