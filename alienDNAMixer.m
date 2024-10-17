function alienDNAMixer
    % Create the main figure
    f = figure('Position', [100, 100, 600, 400], 'MenuBar', 'none', ...
                'Name', 'Alien DNA Mixer', 'NumberTitle', 'off', ...
                'Resize', 'off');

    % Create dropdowns for DNA selection
    uicontrol('Style', 'text', 'Position', [50, 350, 200, 30], ...
              'String', 'Select DNA Strands:');
    
    dna1 = uicontrol('Style', 'popup', 'Position', [50, 300, 200, 30], ...
                     'String', {'Green Goo', 'Fluffy Fuzz', 'Spiky Shell'}, ...
                     'Callback', @updateCreature);
                 
    dna2 = uicontrol('Style', 'popup', 'Position', [50, 250, 200, 30], ...
                     'String', {'Glowing Eyes', 'Wiggly Tentacles', 'Bouncy Tail'}, ...
                     'Callback', @updateCreature);
                 
    % Button to generate creature
    uicontrol('Style', 'pushbutton', 'Position', [50, 200, 200, 30], ...
              'String', 'Generate Alien Creature', 'Callback', @generateCreature);
    
    % Axes for displaying the creature
    axes('Position', [0.4, 0.1, 0.55, 0.8]);
    
    % Text area for creature properties
    creatureText = uicontrol('Style', 'text', 'Position', [50, 50, 200, 100], ...
                              'String', '', 'HorizontalAlignment', 'left');

    % Callback function to update creature
    function updateCreature(~, ~)
        % Update the creature display based on selected DNA
        % (This function can be expanded to show a preview)
    end

    % Generate creature based on selected DNA
    function generateCreature(~, ~)
        dna1Selected = dna1.Value;
        dna2Selected = dna2.Value;
        
        % Create a unique creature based on DNA selections
        creatureName = sprintf('Alien %d-%d', dna1Selected, dna2Selected);
        properties = sprintf('Name: %s\nTraits: %s\nAbilities: %s', ...
                             creatureName, ...
                             randomTrait(), ...
                             randomAbility());
        
        % Display the creature properties
        set(creatureText, 'String', properties);
        
        % Draw the creature (simple shapes for demonstration)
        cla;
        hold on;
        drawCreature(dna1Selected, dna2Selected);
        hold off;
    end

    % Function to draw the creature based on DNA
    function drawCreature(dna1, dna2)
        % Example shapes based on DNA selection
        if dna1 == 1
            rectangle('Position', [0.2, 0.4, 0.2, 0.2], 'FaceColor', 'g'); % Green Goo
        elseif dna1 == 2
            rectangle('Position', [0.2, 0.4, 0.2, 0.2], 'Curvature', [1, 1], 'FaceColor', 'y'); % Fluffy Fuzz
        else
            rectangle('Position', [0.2, 0.4, 0.2, 0.2], 'FaceColor', 'b'); % Spiky Shell
        end
        
        if dna2 == 1
            plot(0.3, 0.5, 'o', 'MarkerSize', 10, 'MarkerFaceColor', 'r'); % Glowing Eyes
        elseif dna2 == 2
            plot(0.3, 0.5, 's', 'MarkerSize', 10, 'MarkerFaceColor', 'm'); % Wiggly Tentacles
        else
            plot(0.3, 0.5, '^', 'MarkerSize', 10, 'MarkerFaceColor', 'c'); % Bouncy Tail
        end
    end

    % Function to generate random traits
    function trait = randomTrait()
        traits = {'Super Slimy', 'Incredible Cuddly', 'Unbelievably Bouncy'};
        trait = traits{randi(length(traits))};
    end

    % Function to generate random abilities
    function ability = randomAbility()
        abilities = {'Can teleport', 'Sings opera', 'Makes excellent coffee'};
        ability = abilities{randi(length(abilities))};
    end
end