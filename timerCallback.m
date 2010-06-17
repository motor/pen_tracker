function timerCallback(obj, event, handles)
    c = get(0,'PointerLocation');

    %set(handles.t, 'UserData', 'test');
    set(handles.t, 'UserData', [get(handles.t, 'UserData'); c]);
end 