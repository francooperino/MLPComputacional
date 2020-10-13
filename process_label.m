function [p]= process_label(label)
% Receives label as a categorical value and returns a vector fill with 
% zeros except for the index of the label.
    zero = zeros(6,1);
    index = grp2idx(label);
    zero(index) = 1;
p = zero;