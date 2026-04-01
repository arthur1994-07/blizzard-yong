package scaleform.clik.managers
{
    import flash.display.*;
    import flash.events.*;
    import flash.geom.*;
    import scaleform.clik.core.*;
    import scaleform.clik.events.*;
    import scaleform.clik.interfaces.*;
    import scaleform.gfx.*;

    public class DragManager extends Object
    {
        static var _stage:Stage;
        static var _dragCanvas:Sprite;
        static var _initialized:Boolean = false;
        static var _inDrag:Boolean = false;
        static var _dragData:Object;
        static var _dragTarget:Sprite;
        static var _origDragSlot:IDragSlot;

        public function DragManager()
        {
            return;
        }// end function

        public static function init(param1:Stage) : void
        {
            if (_initialized)
            {
                return;
            }
            _initialized = true;
            _origDragSlot = null;
            DragManager._stage = param1;
            _dragCanvas = new Sprite();
            var _loc_2:* = false;
            _dragCanvas.mouseChildren = false;
            _dragCanvas.mouseEnabled = _loc_2;
            _stage.addChild(_dragCanvas);
            _stage.addEventListener(DragEvent.DRAG_START, DragManager.handleStartDragEvent, false, 0, true);
            return;
        }// end function

        public static function inDrag() : Boolean
        {
            return _inDrag;
        }// end function

        public static function GetDragTarget() : IDragSlot
        {
            return _origDragSlot;
        }// end function

        public static function handleStartDragEvent(event:DragEvent) : void
        {
            if (event.dragTarget == null || event.dragSprite == null)
            {
                return;
            }
            _dragTarget = event.dragSprite;
            _dragData = event.dragData;
            _origDragSlot = event.dragTarget;
            var _loc_2:* = _dragTarget.localToGlobal(new Point());
            var _loc_3:* = _dragCanvas.localToGlobal(new Point());
            _dragCanvas.addChild(_dragTarget);
            _dragTarget.x = _loc_2.x - _loc_3.x;
            _dragTarget.y = _loc_2.y - _loc_3.y;
            _inDrag = true;
            _stage.addEventListener(MouseEvent.MOUSE_UP, handleEndDragEvent, false, 0, true);
            var _loc_4:* = _dragTarget as MovieClip;
            (_loc_4).startDrag();
            var _loc_5:* = false;
            _loc_4.mouseChildren = false;
            _loc_4.mouseEnabled = _loc_5;
            _loc_4.trackAsMenu = true;
            return;
        }// end function

        public static function handleEndDragEvent(param1:MouseEventEx) : void
        {
            var _loc_5:* = null;
            if (param1.target is UIComponent)
            {
                if ((param1.target as UIComponent).keepSlot == true)
                {
                    _origDragSlot.handleDragEndEvent(null, true);
                    return;
                }
            }
            if (param1.buttonIdx != MouseEventEx.LEFT_BUTTON)
            {
                return;
            }
            _stage.removeEventListener(MouseEvent.MOUSE_UP, handleEndDragEvent, false);
            _inDrag = false;
            var _loc_2:* = false;
            var _loc_3:* = findSpriteAncestorOf(_dragTarget.dropTarget) as IDragSlot;
            if (_loc_3 != null && _loc_3 is IDragSlot && _loc_3 != _origDragSlot)
            {
                _loc_5 = new DragEvent(DragEvent.DROP, _dragData, _origDragSlot, _loc_3, _dragTarget);
                _loc_2 = _loc_3.handleDropEvent(_loc_5);
            }
            _dragTarget.stopDrag();
            var _loc_6:* = true;
            _dragTarget.mouseChildren = true;
            _dragTarget.mouseEnabled = _loc_6;
            (_dragTarget as MovieClip).trackAsMenu = false;
            _dragCanvas.removeChild(_dragTarget);
            var _loc_4:* = new DragEvent(DragEvent.DRAG_END, _dragData, _origDragSlot, _loc_3, _dragTarget);
            _origDragSlot.handleDragEndEvent(_loc_4, _loc_2);
            _origDragSlot.dispatchEvent(_loc_4);
            _dragTarget = null;
            _origDragSlot = null;
            return;
        }// end function

        static function handleStageAddedEvent(event:Event) : void
        {
            return;
        }// end function

        static function findSpriteAncestorOf(param1:DisplayObject) : IDragSlot
        {
            while (param1 && !(param1 is IDragSlot))
            {
                
                param1 = param1.parent;
            }
            return param1 as IDragSlot;
        }// end function

        public static function StopDrag() : void
        {
            if (_dragTarget == null)
            {
                return;
            }
            _stage.removeEventListener(MouseEvent.MOUSE_UP, handleEndDragEvent, false);
            _inDrag = false;
            _dragTarget.stopDrag();
            var _loc_2:* = true;
            _dragTarget.mouseChildren = true;
            _dragTarget.mouseEnabled = _loc_2;
            (_dragTarget as MovieClip).trackAsMenu = false;
            _dragCanvas.removeChild(_dragTarget);
            var _loc_1:* = new DragEvent(DragEvent.DRAG_FORCE_END, _dragData, _origDragSlot, null, _dragTarget);
            _origDragSlot.handleDragEndEvent(_loc_1, false);
            _origDragSlot.dispatchEvent(_loc_1);
            _dragTarget = null;
            _origDragSlot = null;
            return;
        }// end function

    }
}
