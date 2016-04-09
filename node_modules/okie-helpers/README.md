# Okie-helpers

A collection of useful utility functions used by the okie suite
of front-end plugins.

## cleanSpaces

    okieHelpers.cleanSpaces(str)

given a string, make sure that each instance of 
white-space is only one space.

## addClass

    okieHelpers.addClass(element, 'some class names')

Add a classes to an element.
first argument is the target element,
second argument is that class list (space-separated).

## removeClass
    
    okieHelpers.removeClass(element, 'class-name')

Removes a class from an element

## getOuterSize
    
    okieHelpers.getOuterSize(target)

Returns the size of an element as an object with width and height properties

## getTransDuration

    okieHelpers.getTransDuration(element)

Returns an elements computed transitionDuration style property in miliseconds.
Useful for making JavaScript animations match the CSS transitionDuration.

## getViewHeight 
  
    okieHelpers.getViewHeight();

returns the viewPort height.  Uses window.innerHeight when available or 
falls back to document.documentElement.clientHeight

## maxHeightMultiplier

    okieHelpers.maxHeightMultiplier(element)

Get an elements max-height style property.  If max-height is set as 
a percentage okieHelpers.maxHeightMultiplier will convert it to a pixel
value.

## isVisible
  
    okieHelpers.isVisible(element)

Determines if an element is visible by checking offsetWidth and offsetHeight;

## stopEvent

    okieHelpers.stopEvent(event)

Shortcut for:

    if (event.preventDefault) event.preventDefault();
    event.stopPropagation();
    event.stopImmediatePropagation();
