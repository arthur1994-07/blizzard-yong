package 
{
    import ran.ui.core.*;

    dynamic public class AutoCompleteTextInput extends AutocompleteTextBox
    {

        public function AutoCompleteTextInput()
        {
            this.__setProp_scrollList_AutoCompleteTextInput_Layer1_0();
            return;
        }// end function

        function __setProp_scrollList_AutoCompleteTextInput_Layer1_0()
        {
            try
            {
                scrollList["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            scrollList.enabled = true;
            scrollList.focusable = true;
            scrollList.itemRendererName = "DefaultListItemRenderer";
            scrollList.itemRendererInstanceName = "";
            scrollList.margin = 0;
            scrollList.multiSelect = false;
            scrollList.inspectablePadding = {top:0, right:0, bottom:0, left:0};
            scrollList.rowHeight = 0;
            scrollList.scrollBar = "DefaultScrollBar";
            scrollList.treeButtonClassName = "";
            scrollList.treeButtonGap = -1;
            scrollList.treeCheckBoxClassName = "";
            scrollList.treeList = false;
            scrollList.visible = true;
            scrollList.wrapping = "normal";
            try
            {
                scrollList["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

    }
}
