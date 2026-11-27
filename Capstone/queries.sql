create database gig_management;
use gig_management;

-- cascading delete
USE gig_management;

-- 1. PROFILE RELATIONSHIPS - CASCADE


ALTER TABLE admin
DROP FOREIGN KEY fk_admin_user;

ALTER TABLE admin
ADD CONSTRAINT fk_admin_user_cascade
FOREIGN KEY (user_id)
REFERENCES users(id)
ON DELETE CASCADE
ON UPDATE NO ACTION;


ALTER TABLE client
DROP FOREIGN KEY fk_client_user;

ALTER TABLE client
ADD CONSTRAINT fk_client_user_cascade
FOREIGN KEY (user_id)
REFERENCES users(id)
ON DELETE CASCADE
ON UPDATE NO ACTION;


ALTER TABLE contact
DROP FOREIGN KEY fk_contact_user;

ALTER TABLE contact
ADD CONSTRAINT fk_contact_user_cascade
FOREIGN KEY (user_id)
REFERENCES users(id)
ON DELETE CASCADE
ON UPDATE NO ACTION;


ALTER TABLE freelancer
DROP FOREIGN KEY fk_freelancer_user;

ALTER TABLE freelancer
ADD CONSTRAINT fk_freelancer_user_cascade
FOREIGN KEY (user_id)
REFERENCES users(id)
ON DELETE CASCADE
ON UPDATE NO ACTION;

-- 2. MAPPING RELATIONSHIPS - CASCADE


ALTER TABLE freelancer_skills
DROP FOREIGN KEY fk_fs_freelancer;

ALTER TABLE freelancer_skills
ADD CONSTRAINT fk_fs_freelancer_cascade
FOREIGN KEY (freelancer_id)
REFERENCES freelancer(id)
ON DELETE CASCADE
ON UPDATE NO ACTION;


ALTER TABLE freelancer_skills
DROP FOREIGN KEY fk_fs_skills;

ALTER TABLE freelancer_skills
ADD CONSTRAINT fk_fs_skills_cascade
FOREIGN KEY (skills_id)
REFERENCES skills(id)
ON DELETE CASCADE
ON UPDATE NO ACTION;


ALTER TABLE post_skills
DROP FOREIGN KEY fk_ps_post;

ALTER TABLE post_skills
ADD CONSTRAINT fk_ps_post_cascade
FOREIGN KEY (post_id)
REFERENCES post(id)
ON DELETE CASCADE
ON UPDATE NO ACTION;


ALTER TABLE post_skills
DROP FOREIGN KEY fk_ps_skills;

ALTER TABLE post_skills
ADD CONSTRAINT fk_ps_skills_cascade
FOREIGN KEY (skills_id)
REFERENCES skills(id)
ON DELETE CASCADE
ON UPDATE NO ACTION;

-- insertion 
USE gig_management;
USE GIG_MANAGEMENT;
-- 1. USERS
INSERT INTO users (id, username, password, role, is_active)
VALUES
(1, 'Lester Crest', 'DEMO_Lester123', 'ADMIN', 1),
(2, 'Michael De Santa', 'DEMO_Michael123', 'CLIENT', 1),
(3, 'Franklin Clinton', 'DEMO_Franklin123', 'CLIENT', 1),
(4, 'Ellie Williams', 'DEMO_Ellie123', 'FREELANCER', 1),
(5, 'Joel Miller', 'DEMO_Joel123', 'FREELANCER', 1),
(6, 'Abby Anderson', 'DEMO_Abby123', 'FREELANCER', 1),
(7, 'Jason Duval', 'DEMO_Jason123', 'FREELANCER', 1),
(8, 'Lucia Caminos', 'DEMO_Lucia123', 'FREELANCER', 1);
-- 2. ADMIN
INSERT INTO admin (id, user_id, name)
VALUES (1, 1, 'Lester Crest');
-- 3. CLIENTS
INSERT INTO client (id, user_id, name)
VALUES
(1, 2, 'Michael De Santa'),
(2, 3, 'Franklin Clinton');
-- 4. FREELANCERS
INSERT INTO freelancer (id, user_id, name)
VALUES
(1, 4, 'Ellie Williams'),
(2, 5, 'Joel Miller'),
(3, 6, 'Abby Anderson'),
(4, 7, 'Jason Duval'),
(5, 8, 'Lucia Caminos');
-- 5. CONTACT
INSERT INTO contact
(user_id, name, primary_email, secondary_email,
 primary_number, secondary_number)
VALUES
(1, 'Lester Crest', 'lester@example.com', NULL, '9000000001', NULL),
(2, 'Michael De Santa', 'michael@example.com', NULL, '9000000002', NULL),
(3, 'Franklin Clinton', 'franklin@example.com', NULL, '9000000003', NULL),
(4, 'Ellie Williams', 'ellie@example.com', NULL, '9000000004', NULL),
(5, 'Joel Miller', 'joel@example.com', NULL, '9000000005', NULL),
(6, 'Abby Anderson', 'abby@example.com', NULL, '9000000006', NULL),
(7, 'Jason Duval', 'jason@example.com', NULL, '9000000007', NULL),
(8, 'Lucia Caminos', 'lucia@example.com', NULL, '9000000008', NULL);
-- 6. SKILLS
INSERT INTO skills (id, technology, description)
VALUES
(1, 'React', 'Frontend development using React'),
(2, 'Node.js', 'Backend development using Node.js'),
(3, 'Python', 'Python programming and automation'),
(4, 'MySQL', 'Relational database management'),
(5, 'UI/UX', 'User interface and experience design'),
(6, 'Cybersecurity', 'Application security and testing');
-- 7. FREELANCER SKILLS
INSERT INTO freelancer_skills (freelancer_id, skills_id)
VALUES
-- Ellie Williams
(1, 1),
(1, 3),
(1, 5),
-- Joel Miller
(2, 2),
(2, 4),
-- Abby Anderson
(3, 6),
(3, 1),
(3, 4),
-- Jason Duval
(4, 1),
(4, 2),
-- Lucia Caminos
(5, 3),
(5, 5),
(5, 6);
-- 8. POSTS
INSERT INTO post
(id, client_id, project_title, description, budget, deadline, status)
VALUES
(1, 1, 'Safehouse Inventory Platform',
 'Develop a web application to manage safehouse inventory.',
 5000.00, '2026-12-20', 'OPEN'),
(2, 1, 'Los Santos Vehicle Booking App',
 'Develop a vehicle booking and management platform.',
 8000.00, '2026-12-30', 'OPEN'),
(3, 2, 'Jackson Community Portal',
 'Create a community portal with user management.',
 6500.00, '2027-01-15', 'OPEN'),
(4, 2, 'Secure Supply Tracker',
 'Develop a secure supply chain tracking application.',
 9000.00, '2027-01-25', 'OPEN');
-- 9. POST SKILLS
INSERT INTO post_skills (post_id, skills_id)
VALUES
-- Safehouse Inventory
(1, 1),
(1, 5),
-- Vehicle Booking
(2, 2),
(2, 4),
-- Community Portal
(3, 3),
(3, 5),
-- Supply Tracker
(4, 6),
(4, 4);
-- 10. PROPOSALS
INSERT INTO proposal
(id, post_id, freelancer_id, propose_amount, description, status)
VALUES
-- Safehouse Inventory
(1, 1, 1, 4500.00,
 'I can develop the inventory platform using React.', 'ACCEPTED'),
(2, 1, 3, 4800.00,
 'I can develop a secure inventory solution.', 'PENDING'),
(3, 1, 4, 4600.00,
 'I can build a responsive inventory management interface.', 'PENDING'),
-- Vehicle Booking
(4, 2, 2, 7500.00,
 'I can develop the vehicle booking backend.', 'ACCEPTED'),
(5, 2, 4, 7800.00,
 'I can develop the vehicle management platform.', 'PENDING'),
-- Community Portal
(6, 3, 1, 6200.00,
 'I can create an accessible community portal.', 'REJECTED'),
(7, 3, 5, 6100.00,
 'I can build a modern community platform.', 'PENDING'),
-- Supply Tracker
(8, 4, 3, 8500.00,
 'I can develop the secure supply tracking system.', 'PENDING'),
(9, 4, 5, 8700.00,
 'I can implement the security and tracking features.', 'PENDING');
-- 11. CONTRACTS
INSERT INTO contract
(id, proposal_id, agreed_amount, start_date, dead_line, status)
VALUES
(1, 1, 4500.00, '2026-11-01', '2026-11-15', 'COMPLETED'),
(2, 4, 7500.00, '2026-11-05', '2026-11-22', 'COMPLETED');
-- 12. PAYMENTS
INSERT INTO payment
(id, contract_id, total_amount, commission, payment_date, payment_status)
VALUES
(1, 1, 4500.00, 450.00, '2026-11-16', 'COMPLETED'),
(2, 2, 7500.00, 750.00, '2026-11-23', 'COMPLETED');
-- 13. REVIEWS
INSERT INTO review (id, contract_id, rating, comments)
VALUES
(1, 1, 5,
 'Excellent work. Delivered the inventory platform successfully.'),
(2, 2, 4,
 'Good work on the vehicle booking platform.');

-- join test
-- 1. Display proposals received by a client with freelancer details
SELECT
    po.id AS post_id,
    po.project_title,
    f.name AS freelancer_name,
    pr.propose_amount,
    pr.description AS proposal_description,
    pr.status AS proposal_status
    from post po 
    join proposal pr on po.id = pr.post_id
    join freelancer f on f.id = pr.freelancer_id
    where po.client_id =1
    order by pr.propose_amount desc;
    
    -- login procedure
    
DELIMITER $$

CREATE PROCEDURE login
(
    IN p_username VARCHAR(255),
    IN p_password VARCHAR(255),
    OUT p_role VARCHAR(255)
)

BEGIN
    DECLARE v_password VARCHAR(255);
    DECLARE v_role VARCHAR(255);
    DECLARE v_is_active BOOLEAN;

    -- Retrieve user details
    SELECT u.password, u.role, u.is_active
    INTO v_password, v_role, v_is_active
    FROM users u
    WHERE u.username = p_username;

    -- Validate username and password
    IF v_password IS NULL OR p_password <> v_password THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid username or password';
    END IF;

    -- Check account status
    IF v_is_active = FALSE THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'User is not active';
    END IF;

    -- Return user role
    SET p_role = v_role;

END $$

DELIMITER ;


