package 
{
    import flash.display.*;

    dynamic public class ClubList extends MovieClip
    {
        public var list:MaskedList;

        public function ClubList()
        {
            this.__setProp_list_ClubList_TileList_0();
            return;
        }// end function

        function __setProp_list_ClubList_TileList_0()
        {
            try
            {
                this.list["componentInspectorSetting"] = true;
            }
            catch (e:Error)
            {
            }
            this.list.enabled = true;
            this.list.itemRendererName = "MasedListListItemRenderer_ClubMember";
            this.list.itemRendererOffset = {x:0, y:0};
            this.list.maskHeight = -1;
            this.list.maskWidth = -1;
            this.list.multiSelectable = false;
            this.list.rowCount = 1;
            this.list.scrollBarName = "NewScrollBar";
            this.list.scrollSpeed = 10;
            this.list.visible = true;
            try
            {
                this.list["componentInspectorSetting"] = false;
            }
            catch (e:Error)
            {
            }
            return;
        }// end function

    }
}
