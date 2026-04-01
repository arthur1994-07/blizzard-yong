package scaleform.clik.events
{
    import flash.events.*;

    public class TreeEvent extends Event
    {
        public var index:int;
        public static const ITEM_CHECK:String = "treeItemCheck";
        public static const ITEM_EXPAND:String = "treeItemExpand";
        public static const ITEM_COLLAPSE:String = "treeItemCollapse";

        public function TreeEvent(param1:String, param2:int)
        {
            super(param1, false, true);
            this.index = param2;
            return;
        }// end function

    }
}
