--liquibase formatted sql
--changeset {authorName}:{id}

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA bk;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ads; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.ads (
    id integer NOT NULL,
    title character varying(255),
    body text,
    image character varying(255),
    target_url text,
    organization_id integer,
    live boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: ads_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.ads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ads_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.ads_id_seq OWNED BY bk.ads.id;


--
-- Name: b_params; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.b_params (
    id integer NOT NULL,
    old_params text,
    bike_title character varying(255),
    creator_id integer,
    created_bike_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    bike_errors text,
    image character varying(255),
    image_tmp character varying(255),
    image_processed boolean DEFAULT true,
    id_token text,
    params json DEFAULT '{"bike":{}}'::json,
    origin character varying,
    organization_id integer,
    email character varying
);


--
-- Name: b_params_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.b_params_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: b_params_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.b_params_id_seq OWNED BY bk.b_params.id;


--
-- Name: bike_codes; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.bike_codes (
    id integer NOT NULL,
    kind integer DEFAULT 0,
    code character varying,
    bike_id integer,
    organization_id integer,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    claimed_at timestamp without time zone
);


--
-- Name: bike_codes_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.bike_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bike_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.bike_codes_id_seq OWNED BY bk.bike_codes.id;


--
-- Name: bike_organizations; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.bike_organizations (
    id integer NOT NULL,
    bike_id integer,
    organization_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone
);


--
-- Name: bike_organizations_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.bike_organizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bike_organizations_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.bike_organizations_id_seq OWNED BY bk.bike_organizations.id;


--
-- Name: bikes; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.bikes (
    id integer NOT NULL,
    name character varying(255),
    cycle_type_id integer,
    serial_number character varying(255) NOT NULL,
    frame_model character varying(255),
    manufacturer_id integer,
    rear_tire_narrow boolean DEFAULT true,
    frame_material_id integer,
    number_of_seats integer,
    propulsion_type_id integer,
    creation_organization_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    stolen boolean DEFAULT false NOT NULL,
    propulsion_type_other character varying(255),
    manufacturer_other character varying(255),
    zipcode character varying(255),
    cached_data text,
    description text,
    owner_email text,
    thumb_path text,
    video_embed text,
    year integer,
    has_no_serial boolean DEFAULT false NOT NULL,
    creator_id integer,
    front_tire_narrow boolean,
    primary_frame_color_id integer,
    secondary_frame_color_id integer,
    tertiary_frame_color_id integer,
    handlebar_type_id integer,
    handlebar_type_other character varying(255),
    front_wheel_size_id integer,
    rear_wheel_size_id integer,
    rear_gear_type_id integer,
    front_gear_type_id integer,
    additional_registration character varying(255),
    belt_drive boolean DEFAULT false NOT NULL,
    coaster_brake boolean DEFAULT false NOT NULL,
    frame_size character varying(255),
    frame_size_unit character varying(255),
    pdf character varying(255),
    card_id integer,
    recovered boolean DEFAULT false NOT NULL,
    paint_id integer,
    registered_new boolean,
    example boolean DEFAULT false NOT NULL,
    country_id integer,
    serial_normalized character varying(255),
    stock_photo_url character varying(255),
    current_stolen_record_id integer,
    listing_order integer,
    approved_stolen boolean,
    all_description text,
    mnfg_name character varying(255),
    hidden boolean DEFAULT false NOT NULL,
    frame_size_number double precision,
    updator_id integer,
    is_for_sale boolean DEFAULT false NOT NULL,
    made_without_serial boolean DEFAULT false NOT NULL,
    stolen_lat double precision,
    stolen_long double precision,
    creation_state_id integer
);


--
-- Name: bikes_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.bikes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bikes_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.bikes_id_seq OWNED BY bk.bikes.id;


--
-- Name: blogs; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.blogs (
    id integer NOT NULL,
    title text,
    title_slug character varying(255),
    body text,
    body_abbr text,
    user_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    published_at timestamp without time zone,
    tags character varying(255),
    published boolean,
    old_title_slug character varying(255),
    description_abbr text,
    is_listicle boolean DEFAULT false NOT NULL,
    index_image character varying(255),
    index_image_id integer,
    index_image_lg character varying(255)
);


--
-- Name: blogs_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.blogs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: blogs_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.blogs_id_seq OWNED BY bk.blogs.id;


--
-- Name: bulk_imports; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.bulk_imports (
    id integer NOT NULL,
    organization_id integer,
    user_id integer,
    file text,
    progress integer DEFAULT 0,
    no_notify boolean DEFAULT false,
    import_errors json DEFAULT '{}'::json,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: bulk_imports_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.bulk_imports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bulk_imports_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.bulk_imports_id_seq OWNED BY bk.bulk_imports.id;


--
-- Name: cgroups; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.cgroups (
    id integer NOT NULL,
    name character varying(255),
    slug character varying(255),
    description character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: cgroups_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.cgroups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cgroups_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.cgroups_id_seq OWNED BY bk.cgroups.id;


--
-- Name: colors; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.colors (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    priority integer,
    display character varying(255)
);


--
-- Name: colors_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.colors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: colors_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.colors_id_seq OWNED BY bk.colors.id;


--
-- Name: components; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.components (
    id integer NOT NULL,
    cmodel_name character varying(255),
    year integer,
    description text,
    manufacturer_id integer,
    ctype_id integer,
    ctype_other character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    bike_id integer,
    front boolean,
    rear boolean,
    manufacturer_other character varying(255),
    serial_number character varying(255),
    is_stock boolean DEFAULT false NOT NULL
);


--
-- Name: components_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.components_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: components_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.components_id_seq OWNED BY bk.components.id;


--
-- Name: countries; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.countries (
    id integer NOT NULL,
    name character varying(255),
    iso character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.countries_id_seq OWNED BY bk.countries.id;


--
-- Name: creation_states; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.creation_states (
    id integer NOT NULL,
    bike_id integer,
    organization_id integer,
    origin character varying,
    is_bulk boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    is_pos boolean DEFAULT false NOT NULL,
    is_new boolean DEFAULT false NOT NULL,
    creator_id integer,
    bulk_import_id integer
);


--
-- Name: creation_states_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.creation_states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: creation_states_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.creation_states_id_seq OWNED BY bk.creation_states.id;


--
-- Name: ctypes; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.ctypes (
    id integer NOT NULL,
    name character varying(255),
    slug character varying(255),
    secondary_name character varying(255),
    image character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    has_multiple boolean DEFAULT false NOT NULL,
    cgroup_id integer
);


--
-- Name: ctypes_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.ctypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ctypes_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.ctypes_id_seq OWNED BY bk.ctypes.id;


--
-- Name: customer_contacts; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.customer_contacts (
    id integer NOT NULL,
    user_id integer,
    user_email character varying(255),
    creator_id integer,
    creator_email character varying(255),
    title character varying(255),
    contact_type character varying(255),
    body text,
    bike_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    info_hash text
);


--
-- Name: customer_contacts_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.customer_contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: customer_contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.customer_contacts_id_seq OWNED BY bk.customer_contacts.id;


--
-- Name: cycle_types; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.cycle_types (
    id integer NOT NULL,
    name character varying(255),
    slug character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: cycle_types_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.cycle_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cycle_types_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.cycle_types_id_seq OWNED BY bk.cycle_types.id;


--
-- Name: duplicate_bike_groups; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.duplicate_bike_groups (
    id integer NOT NULL,
    ignore boolean DEFAULT false NOT NULL,
    added_bike_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: duplicate_bike_groups_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.duplicate_bike_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: duplicate_bike_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.duplicate_bike_groups_id_seq OWNED BY bk.duplicate_bike_groups.id;


--
-- Name: exports; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.exports (
    id integer NOT NULL,
    organization_id integer,
    user_id integer,
    file text,
    file_format integer DEFAULT 0,
    kind integer DEFAULT 0,
    progress integer DEFAULT 0,
    rows integer,
    options jsonb DEFAULT '{}'::jsonb,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: exports_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.exports_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: exports_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.exports_id_seq OWNED BY bk.exports.id;


--
-- Name: feedbacks; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.feedbacks (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    title character varying(255),
    body text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    feedback_type character varying(255),
    feedback_hash text,
    user_id integer
);


--
-- Name: feedbacks_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.feedbacks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: feedbacks_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.feedbacks_id_seq OWNED BY bk.feedbacks.id;


--
-- Name: flavor_texts; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.flavor_texts (
    id integer NOT NULL,
    message character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: flavor_texts_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.flavor_texts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: flavor_texts_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.flavor_texts_id_seq OWNED BY bk.flavor_texts.id;


--
-- Name: frame_materials; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.frame_materials (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    slug character varying(255)
);


--
-- Name: frame_materials_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.frame_materials_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: frame_materials_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.frame_materials_id_seq OWNED BY bk.frame_materials.id;


--
-- Name: front_gear_types; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.front_gear_types (
    id integer NOT NULL,
    name character varying(255),
    count integer,
    internal boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    standard boolean,
    slug character varying(255)
);


--
-- Name: front_gear_types_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.front_gear_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: front_gear_types_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.front_gear_types_id_seq OWNED BY bk.front_gear_types.id;


--
-- Name: handlebar_types; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.handlebar_types (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    slug character varying(255)
);


--
-- Name: handlebar_types_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.handlebar_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: handlebar_types_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.handlebar_types_id_seq OWNED BY bk.handlebar_types.id;


--
-- Name: integrations; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.integrations (
    id integer NOT NULL,
    user_id integer,
    access_token text,
    provider_name character varying(255),
    information text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: integrations_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.integrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: integrations_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.integrations_id_seq OWNED BY bk.integrations.id;


--
-- Name: invoice_paid_features; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.invoice_paid_features (
    id integer NOT NULL,
    invoice_id integer,
    paid_feature_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: invoice_paid_features_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.invoice_paid_features_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: invoice_paid_features_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.invoice_paid_features_id_seq OWNED BY bk.invoice_paid_features.id;


--
-- Name: invoices; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.invoices (
    id integer NOT NULL,
    organization_id integer,
    first_invoice_id integer,
    is_active boolean DEFAULT false NOT NULL,
    force_active boolean DEFAULT false NOT NULL,
    subscription_start_at timestamp without time zone,
    subscription_end_at timestamp without time zone,
    amount_due_cents integer,
    amount_paid_cents integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: invoices_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.invoices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: invoices_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.invoices_id_seq OWNED BY bk.invoices.id;


--
-- Name: listicles; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.listicles (
    id integer NOT NULL,
    list_order integer,
    body text,
    blog_id integer,
    image character varying(255),
    title text,
    body_html text,
    image_width integer,
    image_height integer,
    image_credits text,
    image_credits_html text,
    crop_top_offset integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: listicles_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.listicles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: listicles_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.listicles_id_seq OWNED BY bk.listicles.id;


--
-- Name: locations; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.locations (
    id integer NOT NULL,
    organization_id integer,
    zipcode character varying(255),
    city character varying(255),
    street character varying(255),
    phone character varying(255),
    email character varying(255),
    name character varying(255),
    latitude double precision,
    longitude double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone,
    shown boolean DEFAULT false,
    country_id integer,
    state_id integer
);


--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.locations_id_seq OWNED BY bk.locations.id;


--
-- Name: lock_types; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.lock_types (
    id integer NOT NULL,
    name character varying(255),
    slug character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: lock_types_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.lock_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lock_types_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.lock_types_id_seq OWNED BY bk.lock_types.id;


--
-- Name: locks; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.locks (
    id integer NOT NULL,
    lock_type_id integer DEFAULT 1,
    has_key boolean DEFAULT true,
    has_combination boolean,
    combination character varying(255),
    key_serial character varying(255),
    manufacturer_id integer,
    manufacturer_other character varying(255),
    user_id integer,
    lock_model character varying(255),
    notes text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: locks_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.locks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: locks_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.locks_id_seq OWNED BY bk.locks.id;


--
-- Name: mail_snippets; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.mail_snippets (
    id integer NOT NULL,
    name character varying(255),
    is_enabled boolean DEFAULT false NOT NULL,
    is_location_triggered boolean DEFAULT false NOT NULL,
    body text,
    address character varying(255),
    latitude double precision,
    longitude double precision,
    proximity_radius integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    organization_id integer,
    kind integer DEFAULT 0
);


--
-- Name: mail_snippets_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.mail_snippets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: mail_snippets_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.mail_snippets_id_seq OWNED BY bk.mail_snippets.id;


--
-- Name: manufacturers; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.manufacturers (
    id integer NOT NULL,
    name character varying(255),
    slug character varying(255),
    website character varying(255),
    frame_maker boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    total_years_active character varying(255),
    notes text,
    open_year integer,
    close_year integer,
    logo character varying(255),
    description text,
    logo_source character varying(255)
);


--
-- Name: manufacturers_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.manufacturers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: manufacturers_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.manufacturers_id_seq OWNED BY bk.manufacturers.id;


--
-- Name: memberships; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.memberships (
    id integer NOT NULL,
    organization_id integer NOT NULL,
    user_id integer,
    role character varying(255) DEFAULT 'member'::character varying NOT NULL,
    invited_email character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone
);


--
-- Name: memberships_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.memberships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: memberships_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.memberships_id_seq OWNED BY bk.memberships.id;


--
-- Name: normalized_serial_segments; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.normalized_serial_segments (
    id integer NOT NULL,
    segment character varying(255),
    bike_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    duplicate_bike_group_id integer
);


--
-- Name: normalized_serial_segments_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.normalized_serial_segments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: normalized_serial_segments_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.normalized_serial_segments_id_seq OWNED BY bk.normalized_serial_segments.id;


--
-- Name: oauth_access_grants; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.oauth_access_grants (
    id integer NOT NULL,
    resource_owner_id integer NOT NULL,
    application_id integer NOT NULL,
    token character varying(255) NOT NULL,
    expires_in integer NOT NULL,
    redirect_uri text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    revoked_at timestamp without time zone,
    scopes character varying(255)
);


--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.oauth_access_grants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: oauth_access_grants_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.oauth_access_grants_id_seq OWNED BY bk.oauth_access_grants.id;


--
-- Name: oauth_access_tokens; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.oauth_access_tokens (
    id integer NOT NULL,
    resource_owner_id integer,
    application_id integer,
    token character varying(255) NOT NULL,
    refresh_token character varying(255),
    expires_in integer,
    revoked_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    scopes character varying(255)
);


--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.oauth_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: oauth_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.oauth_access_tokens_id_seq OWNED BY bk.oauth_access_tokens.id;


--
-- Name: oauth_applications; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.oauth_applications (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    uid character varying(255) NOT NULL,
    secret character varying(255) NOT NULL,
    redirect_uri text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    owner_id integer,
    owner_type character varying(255),
    is_internal boolean DEFAULT false NOT NULL,
    can_send_stolen_notifications boolean DEFAULT false NOT NULL,
    scopes character varying(255) DEFAULT ''::character varying NOT NULL
);


--
-- Name: oauth_applications_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.oauth_applications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: oauth_applications_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.oauth_applications_id_seq OWNED BY bk.oauth_applications.id;


--
-- Name: organization_invitations; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.organization_invitations (
    id integer NOT NULL,
    invitee_email character varying(255),
    invitee_name character varying(255),
    invitee_id integer,
    organization_id integer,
    inviter_id integer,
    redeemed boolean,
    membership_role character varying(255) DEFAULT 'member'::character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone
);


--
-- Name: organization_invitations_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.organization_invitations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_invitations_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.organization_invitations_id_seq OWNED BY bk.organization_invitations.id;


--
-- Name: organization_messages; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.organization_messages (
    id integer NOT NULL,
    kind integer DEFAULT 0,
    organization_id integer,
    sender_id integer,
    bike_id integer,
    email character varying,
    body text,
    delivery_status character varying,
    address character varying,
    latitude double precision,
    longitude double precision,
    accuracy double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: organization_messages_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.organization_messages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organization_messages_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.organization_messages_id_seq OWNED BY bk.organization_messages.id;


--
-- Name: organizations; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.organizations (
    id integer NOT NULL,
    name character varying(255),
    slug character varying(255) NOT NULL,
    available_invitation_count integer DEFAULT 10,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    website character varying(255),
    short_name character varying(255),
    show_on_map boolean,
    sent_invitation_count integer DEFAULT 0,
    deleted_at timestamp without time zone,
    is_suspended boolean DEFAULT false NOT NULL,
    auto_user_id integer,
    org_type character varying(255) DEFAULT 'shop'::character varying NOT NULL,
    access_token character varying(255),
    new_bike_notification text,
    api_access_approved boolean DEFAULT false NOT NULL,
    approved boolean DEFAULT true,
    use_additional_registration_field boolean DEFAULT false NOT NULL,
    avatar character varying(255),
    is_paid boolean DEFAULT false NOT NULL,
    lock_show_on_map boolean DEFAULT false NOT NULL,
    landing_html text,
    show_bulk_import boolean DEFAULT false,
    has_bike_codes boolean DEFAULT false NOT NULL,
    has_bike_search boolean DEFAULT false NOT NULL,
    geolocated_emails boolean DEFAULT false NOT NULL,
    abandoned_bike_emails boolean DEFAULT false NOT NULL,
    require_address_on_registration boolean DEFAULT false NOT NULL,
    show_partial_registrations boolean DEFAULT false NOT NULL,
    paid_feature_slugs jsonb,
    parent_organization_id integer
);


--
-- Name: organizations_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.organizations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: organizations_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.organizations_id_seq OWNED BY bk.organizations.id;


--
-- Name: other_listings; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.other_listings (
    id integer NOT NULL,
    bike_id integer,
    url character varying(255),
    listing_type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: other_listings_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.other_listings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: other_listings_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.other_listings_id_seq OWNED BY bk.other_listings.id;


--
-- Name: ownerships; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.ownerships (
    id integer NOT NULL,
    bike_id integer,
    user_id integer,
    owner_email character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    creator_id integer,
    current boolean DEFAULT false,
    claimed boolean,
    example boolean DEFAULT false NOT NULL,
    send_email boolean DEFAULT true,
    user_hidden boolean DEFAULT false NOT NULL
);


--
-- Name: ownerships_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.ownerships_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ownerships_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.ownerships_id_seq OWNED BY bk.ownerships.id;


--
-- Name: paid_features; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.paid_features (
    id integer NOT NULL,
    kind integer DEFAULT 0,
    amount_cents integer,
    name character varying,
    slug character varying,
    is_locked boolean DEFAULT false NOT NULL,
    description text,
    details_link character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: paid_features_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.paid_features_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: paid_features_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.paid_features_id_seq OWNED BY bk.paid_features.id;


--
-- Name: paints; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.paints (
    id integer NOT NULL,
    name character varying(255),
    color_id integer,
    manufacturer_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    secondary_color_id integer,
    tertiary_color_id integer,
    bikes_count integer DEFAULT 0 NOT NULL
);


--
-- Name: paints_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.paints_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: paints_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.paints_id_seq OWNED BY bk.paints.id;


--
-- Name: payments; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.payments (
    id integer NOT NULL,
    user_id integer,
    is_current boolean DEFAULT true,
    is_recurring boolean DEFAULT false NOT NULL,
    stripe_id character varying(255),
    last_payment_date timestamp without time zone,
    first_payment_date timestamp without time zone,
    amount_cents integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    email character varying(255),
    is_payment boolean DEFAULT false NOT NULL,
    kind integer DEFAULT 0,
    organization_id integer,
    invoice_id integer
);


--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.payments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.payments_id_seq OWNED BY bk.payments.id;


--
-- Name: propulsion_types; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.propulsion_types (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    slug character varying(255)
);


--
-- Name: propulsion_types_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.propulsion_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: propulsion_types_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.propulsion_types_id_seq OWNED BY bk.propulsion_types.id;


--
-- Name: bk_images; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.bk_images (
    id integer NOT NULL,
    image character varying(255),
    name character varying(255),
    listing_order integer DEFAULT 0,
    imageable_id integer,
    imageable_type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    is_private boolean DEFAULT false NOT NULL
);


--
-- Name: bk_images_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.bk_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bk_images_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.bk_images_id_seq OWNED BY bk.bk_images.id;


--
-- Name: rear_gear_types; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.rear_gear_types (
    id integer NOT NULL,
    name character varying(255),
    count integer,
    internal boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    standard boolean,
    slug character varying(255)
);


--
-- Name: rear_gear_types_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.rear_gear_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rear_gear_types_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.rear_gear_types_id_seq OWNED BY bk.rear_gear_types.id;


--
-- Name: recovery_displays; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.recovery_displays (
    id integer NOT NULL,
    stolen_record_id integer,
    quote text,
    quote_by character varying(255),
    date_recovered timestamp without time zone,
    link character varying(255),
    image character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: recovery_displays_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.recovery_displays_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: recovery_displays_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.recovery_displays_id_seq OWNED BY bk.recovery_displays.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: states; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.states (
    id integer NOT NULL,
    name character varying(255),
    abbreviation character varying(255),
    country_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: states_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.states_id_seq OWNED BY bk.states.id;


--
-- Name: stolen_notifications; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.stolen_notifications (
    id integer NOT NULL,
    subject character varying(255),
    message text,
    sender_id integer,
    receiver_id integer,
    bike_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    receiver_email character varying(255),
    oauth_application_id integer,
    reference_url text,
    send_dates json
);


--
-- Name: stolen_notifications_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.stolen_notifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stolen_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.stolen_notifications_id_seq OWNED BY bk.stolen_notifications.id;


--
-- Name: stolen_records; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.stolen_records (
    id integer NOT NULL,
    zipcode character varying(255),
    city character varying(255),
    theft_description text,
    "time" text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    bike_id integer,
    current boolean DEFAULT true,
    street character varying(255),
    latitude double precision,
    longitude double precision,
    date_stolen timestamp without time zone,
    phone character varying(255),
    phone_for_everyone boolean,
    phone_for_users boolean DEFAULT true,
    phone_for_shops boolean DEFAULT true,
    phone_for_police boolean DEFAULT true,
    police_report_number character varying(255),
    locking_description character varying(255),
    lock_defeat_description character varying(255),
    country_id integer,
    police_report_department character varying(255),
    state_id integer,
    creation_organization_id integer,
    secondary_phone character varying(255),
    approved boolean DEFAULT false NOT NULL,
    receive_notifications boolean DEFAULT true,
    proof_of_ownership boolean,
    date_recovered timestamp without time zone,
    recovered_description text,
    index_helped_recovery boolean DEFAULT false NOT NULL,
    can_share_recovery boolean DEFAULT false NOT NULL,
    recovery_posted boolean DEFAULT false,
    recovery_tweet text,
    recovery_share text,
    create_open311 boolean DEFAULT false NOT NULL,
    tsved_at timestamp without time zone,
    estimated_value integer,
    recovery_link_token text
);


--
-- Name: stolen_records_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.stolen_records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stolen_records_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.stolen_records_id_seq OWNED BY bk.stolen_records.id;


--
-- Name: tweets; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.tweets (
    id integer NOT NULL,
    twitter_id character varying,
    twitter_response json,
    body_html text,
    image character varying,
    alignment character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: tweets_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.tweets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tweets_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.tweets_id_seq OWNED BY bk.tweets.id;


--
-- Name: user_emails; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.user_emails (
    id integer NOT NULL,
    email character varying(255),
    user_id integer,
    old_user_id integer,
    confirmation_token text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: user_emails_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.user_emails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_emails_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.user_emails_id_seq OWNED BY bk.user_emails.id;


--
-- Name: users; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.users (
    id integer NOT NULL,
    name character varying(255),
    email character varying(255),
    password text,
    last_login timestamp without time zone,
    superuser boolean DEFAULT false NOT NULL,
    password_reset_token text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    password_digest character varying(255),
    banned boolean DEFAULT false NOT NULL,
    phone character varying(255),
    zipcode character varying(255),
    twitter character varying(255),
    show_twitter boolean DEFAULT false NOT NULL,
    website character varying(255),
    show_website boolean DEFAULT false NOT NULL,
    show_phone boolean DEFAULT true,
    show_bikes boolean DEFAULT false NOT NULL,
    username character varying(255),
    has_stolen_bikes boolean,
    avatar character varying(255),
    description text,
    title text,
    terms_of_service boolean DEFAULT false NOT NULL,
    vendor_terms_of_service boolean,
    when_vendor_terms_of_service timestamp without time zone,
    confirmed boolean DEFAULT false NOT NULL,
    confirmation_token character varying(255),
    can_send_many_stolen_notifications boolean DEFAULT false NOT NULL,
    auth_token character varying(255),
    stripe_id character varying(255),
    is_paid_member boolean DEFAULT false NOT NULL,
    paid_membership_info text,
    is_content_admin boolean DEFAULT false NOT NULL,
    my_bikes_hash text,
    is_emailable boolean DEFAULT false NOT NULL,
    developer boolean DEFAULT false NOT NULL,
    bike_actions_organization_id integer
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.users_id_seq OWNED BY bk.users.id;


--
-- Name: wheel_sizes; Type: TABLE; Schema: bk; Owner: -
--

CREATE TABLE bk.wheel_sizes (
    id integer NOT NULL,
    name character varying(255),
    description character varying(255),
    iso_bsd integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    priority integer
);


--
-- Name: wheel_sizes_id_seq; Type: SEQUENCE; Schema: bk; Owner: -
--

CREATE SEQUENCE bk.wheel_sizes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: wheel_sizes_id_seq; Type: SEQUENCE OWNED BY; Schema: bk; Owner: -
--

ALTER SEQUENCE bk.wheel_sizes_id_seq OWNED BY bk.wheel_sizes.id;


--
-- Name: ads id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.ads ALTER COLUMN id SET DEFAULT nextval('bk.ads_id_seq'::regclass);


--
-- Name: b_params id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.b_params ALTER COLUMN id SET DEFAULT nextval('bk.b_params_id_seq'::regclass);


--
-- Name: bike_codes id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.bike_codes ALTER COLUMN id SET DEFAULT nextval('bk.bike_codes_id_seq'::regclass);


--
-- Name: bike_organizations id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.bike_organizations ALTER COLUMN id SET DEFAULT nextval('bk.bike_organizations_id_seq'::regclass);


--
-- Name: bikes id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.bikes ALTER COLUMN id SET DEFAULT nextval('bk.bikes_id_seq'::regclass);


--
-- Name: blogs id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.blogs ALTER COLUMN id SET DEFAULT nextval('bk.blogs_id_seq'::regclass);


--
-- Name: bulk_imports id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.bulk_imports ALTER COLUMN id SET DEFAULT nextval('bk.bulk_imports_id_seq'::regclass);


--
-- Name: cgroups id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.cgroups ALTER COLUMN id SET DEFAULT nextval('bk.cgroups_id_seq'::regclass);


--
-- Name: colors id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.colors ALTER COLUMN id SET DEFAULT nextval('bk.colors_id_seq'::regclass);


--
-- Name: components id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.components ALTER COLUMN id SET DEFAULT nextval('bk.components_id_seq'::regclass);


--
-- Name: countries id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.countries ALTER COLUMN id SET DEFAULT nextval('bk.countries_id_seq'::regclass);


--
-- Name: creation_states id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.creation_states ALTER COLUMN id SET DEFAULT nextval('bk.creation_states_id_seq'::regclass);


--
-- Name: ctypes id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.ctypes ALTER COLUMN id SET DEFAULT nextval('bk.ctypes_id_seq'::regclass);


--
-- Name: customer_contacts id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.customer_contacts ALTER COLUMN id SET DEFAULT nextval('bk.customer_contacts_id_seq'::regclass);


--
-- Name: cycle_types id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.cycle_types ALTER COLUMN id SET DEFAULT nextval('bk.cycle_types_id_seq'::regclass);


--
-- Name: duplicate_bike_groups id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.duplicate_bike_groups ALTER COLUMN id SET DEFAULT nextval('bk.duplicate_bike_groups_id_seq'::regclass);


--
-- Name: exports id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.exports ALTER COLUMN id SET DEFAULT nextval('bk.exports_id_seq'::regclass);


--
-- Name: feedbacks id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.feedbacks ALTER COLUMN id SET DEFAULT nextval('bk.feedbacks_id_seq'::regclass);


--
-- Name: flavor_texts id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.flavor_texts ALTER COLUMN id SET DEFAULT nextval('bk.flavor_texts_id_seq'::regclass);


--
-- Name: frame_materials id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.frame_materials ALTER COLUMN id SET DEFAULT nextval('bk.frame_materials_id_seq'::regclass);


--
-- Name: front_gear_types id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.front_gear_types ALTER COLUMN id SET DEFAULT nextval('bk.front_gear_types_id_seq'::regclass);


--
-- Name: handlebar_types id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.handlebar_types ALTER COLUMN id SET DEFAULT nextval('bk.handlebar_types_id_seq'::regclass);


--
-- Name: integrations id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.integrations ALTER COLUMN id SET DEFAULT nextval('bk.integrations_id_seq'::regclass);


--
-- Name: invoice_paid_features id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.invoice_paid_features ALTER COLUMN id SET DEFAULT nextval('bk.invoice_paid_features_id_seq'::regclass);


--
-- Name: invoices id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.invoices ALTER COLUMN id SET DEFAULT nextval('bk.invoices_id_seq'::regclass);


--
-- Name: listicles id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.listicles ALTER COLUMN id SET DEFAULT nextval('bk.listicles_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.locations ALTER COLUMN id SET DEFAULT nextval('bk.locations_id_seq'::regclass);


--
-- Name: lock_types id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.lock_types ALTER COLUMN id SET DEFAULT nextval('bk.lock_types_id_seq'::regclass);


--
-- Name: locks id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.locks ALTER COLUMN id SET DEFAULT nextval('bk.locks_id_seq'::regclass);


--
-- Name: mail_snippets id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.mail_snippets ALTER COLUMN id SET DEFAULT nextval('bk.mail_snippets_id_seq'::regclass);


--
-- Name: manufacturers id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.manufacturers ALTER COLUMN id SET DEFAULT nextval('bk.manufacturers_id_seq'::regclass);


--
-- Name: memberships id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.memberships ALTER COLUMN id SET DEFAULT nextval('bk.memberships_id_seq'::regclass);


--
-- Name: normalized_serial_segments id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.normalized_serial_segments ALTER COLUMN id SET DEFAULT nextval('bk.normalized_serial_segments_id_seq'::regclass);


--
-- Name: oauth_access_grants id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.oauth_access_grants ALTER COLUMN id SET DEFAULT nextval('bk.oauth_access_grants_id_seq'::regclass);


--
-- Name: oauth_access_tokens id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.oauth_access_tokens ALTER COLUMN id SET DEFAULT nextval('bk.oauth_access_tokens_id_seq'::regclass);


--
-- Name: oauth_applications id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.oauth_applications ALTER COLUMN id SET DEFAULT nextval('bk.oauth_applications_id_seq'::regclass);


--
-- Name: organization_invitations id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.organization_invitations ALTER COLUMN id SET DEFAULT nextval('bk.organization_invitations_id_seq'::regclass);


--
-- Name: organization_messages id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.organization_messages ALTER COLUMN id SET DEFAULT nextval('bk.organization_messages_id_seq'::regclass);


--
-- Name: organizations id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.organizations ALTER COLUMN id SET DEFAULT nextval('bk.organizations_id_seq'::regclass);


--
-- Name: other_listings id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.other_listings ALTER COLUMN id SET DEFAULT nextval('bk.other_listings_id_seq'::regclass);


--
-- Name: ownerships id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.ownerships ALTER COLUMN id SET DEFAULT nextval('bk.ownerships_id_seq'::regclass);


--
-- Name: paid_features id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.paid_features ALTER COLUMN id SET DEFAULT nextval('bk.paid_features_id_seq'::regclass);


--
-- Name: paints id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.paints ALTER COLUMN id SET DEFAULT nextval('bk.paints_id_seq'::regclass);


--
-- Name: payments id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.payments ALTER COLUMN id SET DEFAULT nextval('bk.payments_id_seq'::regclass);


--
-- Name: propulsion_types id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.propulsion_types ALTER COLUMN id SET DEFAULT nextval('bk.propulsion_types_id_seq'::regclass);


--
-- Name: bk_images id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.bk_images ALTER COLUMN id SET DEFAULT nextval('bk.bk_images_id_seq'::regclass);


--
-- Name: rear_gear_types id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.rear_gear_types ALTER COLUMN id SET DEFAULT nextval('bk.rear_gear_types_id_seq'::regclass);


--
-- Name: recovery_displays id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.recovery_displays ALTER COLUMN id SET DEFAULT nextval('bk.recovery_displays_id_seq'::regclass);


--
-- Name: states id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.states ALTER COLUMN id SET DEFAULT nextval('bk.states_id_seq'::regclass);


--
-- Name: stolen_notifications id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.stolen_notifications ALTER COLUMN id SET DEFAULT nextval('bk.stolen_notifications_id_seq'::regclass);


--
-- Name: stolen_records id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.stolen_records ALTER COLUMN id SET DEFAULT nextval('bk.stolen_records_id_seq'::regclass);


--
-- Name: tweets id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.tweets ALTER COLUMN id SET DEFAULT nextval('bk.tweets_id_seq'::regclass);


--
-- Name: user_emails id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.user_emails ALTER COLUMN id SET DEFAULT nextval('bk.user_emails_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.users ALTER COLUMN id SET DEFAULT nextval('bk.users_id_seq'::regclass);


--
-- Name: wheel_sizes id; Type: DEFAULT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.wheel_sizes ALTER COLUMN id SET DEFAULT nextval('bk.wheel_sizes_id_seq'::regclass);


--
-- Name: ads ads_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.ads
    ADD CONSTRAINT ads_pkey PRIMARY KEY (id);


--
-- Name: b_params b_params_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.b_params
    ADD CONSTRAINT b_params_pkey PRIMARY KEY (id);


--
-- Name: bike_codes bike_codes_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.bike_codes
    ADD CONSTRAINT bike_codes_pkey PRIMARY KEY (id);


--
-- Name: bike_organizations bike_organizations_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.bike_organizations
    ADD CONSTRAINT bike_organizations_pkey PRIMARY KEY (id);


--
-- Name: bikes bikes_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.bikes
    ADD CONSTRAINT bikes_pkey PRIMARY KEY (id);


--
-- Name: blogs blogs_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.blogs
    ADD CONSTRAINT blogs_pkey PRIMARY KEY (id);


--
-- Name: bulk_imports bulk_imports_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.bulk_imports
    ADD CONSTRAINT bulk_imports_pkey PRIMARY KEY (id);


--
-- Name: cgroups cgroups_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.cgroups
    ADD CONSTRAINT cgroups_pkey PRIMARY KEY (id);


--
-- Name: colors colors_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.colors
    ADD CONSTRAINT colors_pkey PRIMARY KEY (id);


--
-- Name: components components_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.components
    ADD CONSTRAINT components_pkey PRIMARY KEY (id);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: creation_states creation_states_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.creation_states
    ADD CONSTRAINT creation_states_pkey PRIMARY KEY (id);


--
-- Name: ctypes ctypes_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.ctypes
    ADD CONSTRAINT ctypes_pkey PRIMARY KEY (id);


--
-- Name: customer_contacts customer_contacts_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.customer_contacts
    ADD CONSTRAINT customer_contacts_pkey PRIMARY KEY (id);


--
-- Name: cycle_types cycle_types_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.cycle_types
    ADD CONSTRAINT cycle_types_pkey PRIMARY KEY (id);


--
-- Name: duplicate_bike_groups duplicate_bike_groups_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.duplicate_bike_groups
    ADD CONSTRAINT duplicate_bike_groups_pkey PRIMARY KEY (id);


--
-- Name: exports exports_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.exports
    ADD CONSTRAINT exports_pkey PRIMARY KEY (id);


--
-- Name: feedbacks feedbacks_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.feedbacks
    ADD CONSTRAINT feedbacks_pkey PRIMARY KEY (id);


--
-- Name: flavor_texts flavor_texts_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.flavor_texts
    ADD CONSTRAINT flavor_texts_pkey PRIMARY KEY (id);


--
-- Name: frame_materials frame_materials_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.frame_materials
    ADD CONSTRAINT frame_materials_pkey PRIMARY KEY (id);


--
-- Name: front_gear_types front_gear_types_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.front_gear_types
    ADD CONSTRAINT front_gear_types_pkey PRIMARY KEY (id);


--
-- Name: handlebar_types handlebar_types_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.handlebar_types
    ADD CONSTRAINT handlebar_types_pkey PRIMARY KEY (id);


--
-- Name: integrations integrations_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.integrations
    ADD CONSTRAINT integrations_pkey PRIMARY KEY (id);


--
-- Name: invoice_paid_features invoice_paid_features_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.invoice_paid_features
    ADD CONSTRAINT invoice_paid_features_pkey PRIMARY KEY (id);


--
-- Name: invoices invoices_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.invoices
    ADD CONSTRAINT invoices_pkey PRIMARY KEY (id);


--
-- Name: listicles listicles_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.listicles
    ADD CONSTRAINT listicles_pkey PRIMARY KEY (id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: lock_types lock_types_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.lock_types
    ADD CONSTRAINT lock_types_pkey PRIMARY KEY (id);


--
-- Name: locks locks_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.locks
    ADD CONSTRAINT locks_pkey PRIMARY KEY (id);


--
-- Name: mail_snippets mail_snippets_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.mail_snippets
    ADD CONSTRAINT mail_snippets_pkey PRIMARY KEY (id);


--
-- Name: manufacturers manufacturers_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.manufacturers
    ADD CONSTRAINT manufacturers_pkey PRIMARY KEY (id);


--
-- Name: memberships memberships_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.memberships
    ADD CONSTRAINT memberships_pkey PRIMARY KEY (id);


--
-- Name: normalized_serial_segments normalized_serial_segments_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.normalized_serial_segments
    ADD CONSTRAINT normalized_serial_segments_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_grants oauth_access_grants_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.oauth_access_grants
    ADD CONSTRAINT oauth_access_grants_pkey PRIMARY KEY (id);


--
-- Name: oauth_access_tokens oauth_access_tokens_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.oauth_access_tokens
    ADD CONSTRAINT oauth_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: oauth_applications oauth_applications_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.oauth_applications
    ADD CONSTRAINT oauth_applications_pkey PRIMARY KEY (id);


--
-- Name: organization_invitations organization_invitations_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.organization_invitations
    ADD CONSTRAINT organization_invitations_pkey PRIMARY KEY (id);


--
-- Name: organization_messages organization_messages_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.organization_messages
    ADD CONSTRAINT organization_messages_pkey PRIMARY KEY (id);


--
-- Name: organizations organizations_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.organizations
    ADD CONSTRAINT organizations_pkey PRIMARY KEY (id);


--
-- Name: other_listings other_listings_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.other_listings
    ADD CONSTRAINT other_listings_pkey PRIMARY KEY (id);


--
-- Name: ownerships ownerships_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.ownerships
    ADD CONSTRAINT ownerships_pkey PRIMARY KEY (id);


--
-- Name: paid_features paid_features_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.paid_features
    ADD CONSTRAINT paid_features_pkey PRIMARY KEY (id);


--
-- Name: paints paints_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.paints
    ADD CONSTRAINT paints_pkey PRIMARY KEY (id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: propulsion_types propulsion_types_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.propulsion_types
    ADD CONSTRAINT propulsion_types_pkey PRIMARY KEY (id);


--
-- Name: bk_images bk_images_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.bk_images
    ADD CONSTRAINT bk_images_pkey PRIMARY KEY (id);


--
-- Name: rear_gear_types rear_gear_types_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.rear_gear_types
    ADD CONSTRAINT rear_gear_types_pkey PRIMARY KEY (id);


--
-- Name: recovery_displays recovery_displays_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.recovery_displays
    ADD CONSTRAINT recovery_displays_pkey PRIMARY KEY (id);


--
-- Name: states states_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- Name: stolen_records stolen_bike_descriptions_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.stolen_records
    ADD CONSTRAINT stolen_bike_descriptions_pkey PRIMARY KEY (id);


--
-- Name: stolen_notifications stolen_notifications_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.stolen_notifications
    ADD CONSTRAINT stolen_notifications_pkey PRIMARY KEY (id);


--
-- Name: tweets tweets_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.tweets
    ADD CONSTRAINT tweets_pkey PRIMARY KEY (id);


--
-- Name: user_emails user_emails_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.user_emails
    ADD CONSTRAINT user_emails_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: wheel_sizes wheel_sizes_pkey; Type: CONSTRAINT; Schema: bk; Owner: -
--

ALTER TABLE ONLY bk.wheel_sizes
    ADD CONSTRAINT wheel_sizes_pkey PRIMARY KEY (id);


--
-- Name: index_b_params_on_organization_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_b_params_on_organization_id ON bk.b_params USING btree (organization_id);


--
-- Name: index_bike_codes_on_bike_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_bike_codes_on_bike_id ON bk.bike_codes USING btree (bike_id);


--
-- Name: index_bike_organizations_on_bike_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_bike_organizations_on_bike_id ON bk.bike_organizations USING btree (bike_id);


--
-- Name: index_bike_organizations_on_deleted_at; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_bike_organizations_on_deleted_at ON bk.bike_organizations USING btree (deleted_at);


--
-- Name: index_bike_organizations_on_organization_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_bike_organizations_on_organization_id ON bk.bike_organizations USING btree (organization_id);


--
-- Name: index_bikes_on_card_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_bikes_on_card_id ON bk.bikes USING btree (card_id);


--
-- Name: index_bikes_on_creation_state_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_bikes_on_creation_state_id ON bk.bikes USING btree (creation_state_id);


--
-- Name: index_bikes_on_current_stolen_record_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_bikes_on_current_stolen_record_id ON bk.bikes USING btree (current_stolen_record_id);


--
-- Name: index_bikes_on_cycle_type_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_bikes_on_cycle_type_id ON bk.bikes USING btree (cycle_type_id);


--
-- Name: index_bikes_on_manufacturer_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_bikes_on_manufacturer_id ON bk.bikes USING btree (manufacturer_id);


--
-- Name: index_bikes_on_organization_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_bikes_on_organization_id ON bk.bikes USING btree (creation_organization_id);


--
-- Name: index_bikes_on_paint_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_bikes_on_paint_id ON bk.bikes USING btree (paint_id);


--
-- Name: index_bikes_on_primary_frame_color_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_bikes_on_primary_frame_color_id ON bk.bikes USING btree (primary_frame_color_id);


--
-- Name: index_bikes_on_secondary_frame_color_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_bikes_on_secondary_frame_color_id ON bk.bikes USING btree (secondary_frame_color_id);


--
-- Name: index_bikes_on_stolen_lat_and_stolen_long; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_bikes_on_stolen_lat_and_stolen_long ON bk.bikes USING btree (stolen_lat, stolen_long);


--
-- Name: index_bikes_on_tertiary_frame_color_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_bikes_on_tertiary_frame_color_id ON bk.bikes USING btree (tertiary_frame_color_id);


--
-- Name: index_components_on_bike_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_components_on_bike_id ON bk.components USING btree (bike_id);


--
-- Name: index_components_on_manufacturer_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_components_on_manufacturer_id ON bk.components USING btree (manufacturer_id);


--
-- Name: index_creation_states_on_bike_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_creation_states_on_bike_id ON bk.creation_states USING btree (bike_id);


--
-- Name: index_creation_states_on_creator_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_creation_states_on_creator_id ON bk.creation_states USING btree (creator_id);


--
-- Name: index_creation_states_on_organization_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_creation_states_on_organization_id ON bk.creation_states USING btree (organization_id);


--
-- Name: index_exports_on_organization_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_exports_on_organization_id ON bk.exports USING btree (organization_id);


--
-- Name: index_exports_on_user_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_exports_on_user_id ON bk.exports USING btree (user_id);


--
-- Name: index_feedbacks_on_user_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_feedbacks_on_user_id ON bk.feedbacks USING btree (user_id);


--
-- Name: index_integrations_on_user_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_integrations_on_user_id ON bk.integrations USING btree (user_id);


--
-- Name: index_invoice_paid_features_on_invoice_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_invoice_paid_features_on_invoice_id ON bk.invoice_paid_features USING btree (invoice_id);


--
-- Name: index_invoice_paid_features_on_paid_feature_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_invoice_paid_features_on_paid_feature_id ON bk.invoice_paid_features USING btree (paid_feature_id);


--
-- Name: index_invoices_on_first_invoice_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_invoices_on_first_invoice_id ON bk.invoices USING btree (first_invoice_id);


--
-- Name: index_invoices_on_organization_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_invoices_on_organization_id ON bk.invoices USING btree (organization_id);


--
-- Name: index_locks_on_user_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_locks_on_user_id ON bk.locks USING btree (user_id);


--
-- Name: index_mail_snippets_on_organization_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_mail_snippets_on_organization_id ON bk.mail_snippets USING btree (organization_id);


--
-- Name: index_memberships_on_organization_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_memberships_on_organization_id ON bk.memberships USING btree (organization_id);


--
-- Name: index_memberships_on_user_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_memberships_on_user_id ON bk.memberships USING btree (user_id);


--
-- Name: index_normalized_serial_segments_on_bike_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_normalized_serial_segments_on_bike_id ON bk.normalized_serial_segments USING btree (bike_id);


--
-- Name: index_normalized_serial_segments_on_duplicate_bike_group_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_normalized_serial_segments_on_duplicate_bike_group_id ON bk.normalized_serial_segments USING btree (duplicate_bike_group_id);


--
-- Name: index_oauth_access_grants_on_token; Type: INDEX; Schema: bk; Owner: -
--

CREATE UNIQUE INDEX index_oauth_access_grants_on_token ON bk.oauth_access_grants USING btree (token);


--
-- Name: index_oauth_access_tokens_on_refresh_token; Type: INDEX; Schema: bk; Owner: -
--

CREATE UNIQUE INDEX index_oauth_access_tokens_on_refresh_token ON bk.oauth_access_tokens USING btree (refresh_token);


--
-- Name: index_oauth_access_tokens_on_resource_owner_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_oauth_access_tokens_on_resource_owner_id ON bk.oauth_access_tokens USING btree (resource_owner_id);


--
-- Name: index_oauth_access_tokens_on_token; Type: INDEX; Schema: bk; Owner: -
--

CREATE UNIQUE INDEX index_oauth_access_tokens_on_token ON bk.oauth_access_tokens USING btree (token);


--
-- Name: index_oauth_applications_on_owner_id_and_owner_type; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_oauth_applications_on_owner_id_and_owner_type ON bk.oauth_applications USING btree (owner_id, owner_type);


--
-- Name: index_oauth_applications_on_uid; Type: INDEX; Schema: bk; Owner: -
--

CREATE UNIQUE INDEX index_oauth_applications_on_uid ON bk.oauth_applications USING btree (uid);


--
-- Name: index_organization_invitations_on_organization_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_organization_invitations_on_organization_id ON bk.organization_invitations USING btree (organization_id);


--
-- Name: index_organization_messages_on_bike_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_organization_messages_on_bike_id ON bk.organization_messages USING btree (bike_id);


--
-- Name: index_organization_messages_on_organization_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_organization_messages_on_organization_id ON bk.organization_messages USING btree (organization_id);


--
-- Name: index_organization_messages_on_sender_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_organization_messages_on_sender_id ON bk.organization_messages USING btree (sender_id);


--
-- Name: index_organizations_on_parent_organization_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_organizations_on_parent_organization_id ON bk.organizations USING btree (parent_organization_id);


--
-- Name: index_organizations_on_slug; Type: INDEX; Schema: bk; Owner: -
--

CREATE UNIQUE INDEX index_organizations_on_slug ON bk.organizations USING btree (slug);


--
-- Name: index_ownerships_on_bike_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_ownerships_on_bike_id ON bk.ownerships USING btree (bike_id);


--
-- Name: index_ownerships_on_creator_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_ownerships_on_creator_id ON bk.ownerships USING btree (creator_id);


--
-- Name: index_ownerships_on_user_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_ownerships_on_user_id ON bk.ownerships USING btree (user_id);


--
-- Name: index_payments_on_user_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_payments_on_user_id ON bk.payments USING btree (user_id);


--
-- Name: index_bk_images_on_imageable_id_and_imageable_type; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_bk_images_on_imageable_id_and_imageable_type ON bk.bk_images USING btree (imageable_id, imageable_type);


--
-- Name: index_recovery_displays_on_stolen_record_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_recovery_displays_on_stolen_record_id ON bk.recovery_displays USING btree (stolen_record_id);


--
-- Name: index_states_on_country_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_states_on_country_id ON bk.states USING btree (country_id);


--
-- Name: index_stolen_notifications_on_oauth_application_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_stolen_notifications_on_oauth_application_id ON bk.stolen_notifications USING btree (oauth_application_id);


--
-- Name: index_stolen_records_on_bike_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_stolen_records_on_bike_id ON bk.stolen_records USING btree (bike_id);


--
-- Name: index_stolen_records_on_latitude_and_longitude; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_stolen_records_on_latitude_and_longitude ON bk.stolen_records USING btree (latitude, longitude);


--
-- Name: index_user_emails_on_user_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_user_emails_on_user_id ON bk.user_emails USING btree (user_id);


--
-- Name: index_users_on_bike_actions_organization_id; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_users_on_bike_actions_organization_id ON bk.users USING btree (bike_actions_organization_id);


--
-- Name: index_users_on_password_reset_token; Type: INDEX; Schema: bk; Owner: -
--

CREATE INDEX index_users_on_password_reset_token ON bk.users USING btree (password_reset_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: bk; Owner: -
--

CREATE UNIQUE INDEX unique_schema_migrations ON bk.schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", bk;
