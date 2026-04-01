package scaleform.clik.interfaces
{
    import flash.display.*;
    import scaleform.clik.events.*;
    import scaleform.clik.interfaces.*;

    public interface IDragSlot extends IUIComponent
    {

        public function IDragSlot();

        function get data() : Object;

        function set data(param1:Object) : void;

        function get content() : Sprite;

        function set content(param1:Sprite) : void;

        function handleDropEvent(event:DragEvent) : Boolean;

        function handleDragStartEvent(event:DragEvent) : void;

        function handleDragEndEvent(event:DragEvent, param2:Boolean) : void;

    }
}
