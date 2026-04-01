package scaleform.clik.events
{
    import flash.display.*;
    import flash.events.*;
    import scaleform.clik.interfaces.*;

    public class DragEvent extends Event
    {
        public var dragData:Object;
        public var dragTarget:IDragSlot;
        public var dropTarget:IDragSlot;
        public var dragSprite:Sprite;
        public static const DROP:String = "drop";
        public static const DRAG_START:String = "dragStart";
        public static const DRAG_END:String = "dragEnd";
        public static const DRAG_FORCE_END:String = "dragForceEnd";

        public function DragEvent(param1:String, param2:Object, param3:IDragSlot, param4:IDragSlot, param5:Sprite, param6:Boolean = true, param7:Boolean = true)
        {
            this.dragData = param2;
            this.dragTarget = param3;
            this.dropTarget = param4;
            this.dragSprite = param5;
            super(param1, param6, param7);
            return;
        }// end function

    }
}
